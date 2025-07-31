/*
 * Copyright 2020-2022 F4PGA Authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 */

#include "kernel/log.h"
#include "kernel/register.h"
#include "kernel/rtlil.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct SynthEclipse2Pass : public ScriptPass {
	SynthEclipse2Pass() : ScriptPass("synth_eclipse2", "synthesis for QuickLogic Eclipse 2 FPGAs.") {}

	void help() override
	{
		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    synth_eclipse2 [options]\n");
		log("\n");
		log("This command runs synthesis for QuickLogic Eclipse 2 FPGAs.\n");
		log("\n");
		log("    -top <module>\n");
		log("        use the specified module as top module\n");
		log("\n");
		log("\n");
		log("    -noflatten\n");
		log("        do not flatten design before synthesis; useful for per-module area\n");
		log("        statistics\n");
		log("\n");
		log("    -dff\n");
		log("        pass DFFs to ABC to perform sequential logic optimisations\n");
		log("        (EXPERIMENTAL)\n");
		log("\n");
		log("    -run <from_label>:<to_label>\n");
		log("        only run the commands between the labels (see below). an empty\n");
		log("        from label is synonymous to 'begin', and empty to label is\n");
		log("        synonymous to the end of the command list.\n");
		log("\n");
		log("    -nocarry\n");
		log("        do not use FADD1_P2 cells in output netlist\n");
        log("\n");
		log("    -noiopad\n");
		log("        do not instantiate IO buffers\n");
		log("\n");
		log("    -noclkbuf\n");
		log("        do not insert global clock buffers\n");
		log("\n");
		log("    -edif <file>\n");
		log("        write the design to the specified edif file. writing of an output file\n");
		log("        is omitted if this parameter is not specified.\n");
		log("\n");
		log("The following commands are executed by this synthesis command:\n");
		help_script();
		log("\n");
	}

	std::string top_opt, edif_file;
	bool flatten, dff, nocarry, noiopad, noclkbuf;

	void clear_flags() override
	{
		top_opt = "-auto-top";
		edif_file = "";
		flatten = true;
		dff = false;
		nocarry = false;
		noiopad = false;
		noclkbuf = false;
	}

	void execute(std::vector<std::string> args, RTLIL::Design *design) override
	{
		string run_from, run_to;
		clear_flags();

		size_t argidx;
		for (argidx = 1; argidx < args.size(); argidx++) {
			if (args[argidx] == "-top" && argidx + 1 < args.size()) {
				top_opt = "-top " + args[++argidx];
				continue;
			}
			if (args[argidx] == "-run" && argidx + 1 < args.size()) {
				size_t pos = args[argidx + 1].find(':');
				if (pos == std::string::npos)
					break;
				run_from = args[++argidx].substr(0, pos);
				run_to = args[argidx].substr(pos + 1);
				continue;
			}
			if (args[argidx] == "-noflatten") {
				flatten = false;
				continue;
			}
			if (args[argidx] == "-dff") {
				dff = true;
				continue;
			}
			if (args[argidx] == "-nocarry") {
				nocarry = true;
				continue;
			}
			if (args[argidx] == "-noiopad") {
				noiopad = true;
				continue;
			}
			if (args[argidx] == "-noclkbuf") {
				noclkbuf = true;
				continue;
			}
			if (args[argidx] == "-edif" && argidx+1 < args.size()) {
				edif_file = args[++argidx];
				continue;
			}
			break;
		}
		extra_args(args, argidx, design);

		if (!design->full_selection())
			log_cmd_error("This command only operates on fully selected designs!\n");

		log_header(design, "Executing SYNTH_ECLIPSE2 pass.\n");
		log_push();

		run_script(design, run_from, run_to);

		log_pop();
	}

	void script() override
	{
		if (check_label("begin")) {
			run(stringf("read_verilog -lib +/quicklogic/eclipse2/cells_sim.v"));
			run(stringf("read_verilog -lib +/quicklogic/eclipse2/cells_gen.v"));
			run(stringf("hierarchy -check %s", help_mode ? "-top <top>" : top_opt.c_str()));
		}

		if (check_label("coarse")) {
			run("proc");
			if (flatten || help_mode)
				run("flatten", "(skip if -noflatten)");
			run("tribuf -logic");
			run("deminout");
			run("opt_expr");
			run("opt_clean");
			run("check");
			run("opt -nodffe -nosdff");
			run("fsm");
			run("opt");
			run("wreduce");
			run("peepopt");
			run("opt_clean");
			run("share");
			run("opt_expr");
			run("opt_clean");
			run("alumacc");
			if (!nocarry)
				run("techmap -map +/quicklogic/eclipse2/alu_map.v");
			run("opt");
			run("memory -nomap");
			run("opt_clean");
		}

		if (check_label("map_ffram")) {
			run("memory_map");
			run("opt -full");
		}

		if (check_label("map_ffs")) {
			run("techmap");
			run("dfflegalize -cell $_DFFSR_PPP_ 0 -cell $_DFF_PP?_ 0 -cell $_DFF_P_ 0 -cell $_DLATCH_PP?_ x -cell $_DLATCH_P_ x");
			run("techmap -map +/quicklogic/eclipse2/dff_map.v");
			run("opt -full -undriven -mux_undef");
			run("clean -purge");
		}

		if (check_label("map_luts")) {
			run("simplemap");
			run(stringf("abc %s -genlib +/quicklogic/eclipse2/eclipse2.genlib", help_mode ? "[-dff]" : dff ? "-dff" : ""));
			run("opt -fast");
			run("autoname");
		}

		if (check_label("check")) {
			if (!noclkbuf)
				run("clkbufmap -inpad ckpad Q:P", "(unless -noclkbuf)");
			if (!noiopad)
				run("iopadmap -bits -outpad outpad A:P -inpad inpad Q:P -tinoutpad bipad EN:Q:A:P A:top", "(unless -noiopad)");
			run("clean");
			run("hierarchy -check");
			run("stat");
			run("check");
			run("blackbox =A:whitebox");
		}

		if (check_label("edif")) {
			if (!edif_file.empty() || help_mode)
				run(stringf("write_edif -nogndvcc %s", edif_file.c_str()));
		}
	}
} SynthEclipse2Pass;

PRIVATE_NAMESPACE_END
