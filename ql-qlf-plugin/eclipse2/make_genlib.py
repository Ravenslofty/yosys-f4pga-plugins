# Copyright 2020-2022 F4PGA Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

genlib = open("techlibs/eclipse2/eclipse2.genlib", "w")
simlib = open("techlibs/eclipse2/cells_gen.v", "w")

print("""
GATE $__ZERO 0 Y=CONST0;
GATE $__ONE 0 Y=CONST1;

GATE $_BUF_ 5 Y=A;
PIN * NONINV 1 9999 10 5 10 5
""", file=genlib)

def build_gate_with_expr(name: str, input_count: int, expr: str, inputs: list[str] = []):
    if inputs == []:
        inputs = [chr(ord("A") + input) for input in range(input_count)]

    print(f"GATE {name} 1 Q={expr};", file=genlib)
    print("PIN * UNKNOWN 1 9999 10 5 10 5", file=genlib)
    print("", file=genlib)

    params = "input " + ", input ".join(inputs) + ", output Q"
    print(f"module {name} ({params});", file=simlib)
    print(f"assign Q = {expr};", file=simlib)
    print("endmodule", file=simlib)
    print("", file=simlib)

def build_gate_with_config(name: str, input_count: int, inversion_count: int, output_inverted: bool, op: str):
    expr = "(" + f" {op} ".join([("!" if input_count - input <= inversion_count else "") + chr(ord("A") + input) for input in range(input_count)]) + ")"
    if output_inverted:
        expr = "!" + expr
    build_gate_with_expr(f"{name}{input_count}i{inversion_count}", input_count, expr)

def build_gate(name: str, output_inverted: bool, op: str):
    for input_count in range(2, 7):
        for inversion_count in range(0, input_count+1):
            build_gate_with_config(name, input_count, inversion_count, output_inverted, op)

def build_mux2():
    for inversion_mask in range(4):
        inv_A = "!" if inversion_mask & 1 == 1 else ""
        inv_B = "!" if inversion_mask & 2 == 2 else ""
        build_gate_with_expr(f"mux2x{inversion_mask:x}",  3, f"(!S & {inv_A}A) | (S & {inv_B}B)", inputs=["S", "A", "B"])

def build_mux4():
    for inversion_mask in range(16):
        inv_A = "!" if inversion_mask & 1 == 1 else ""
        inv_B = "!" if inversion_mask & 2 == 2 else ""
        inv_C = "!" if inversion_mask & 4 == 4 else ""
        inv_D = "!" if inversion_mask & 8 == 8 else ""
        build_gate_with_expr(f"mux4x{inversion_mask:x}",  6, f"(!S1 & !S0 & {inv_A}A) | (!S1 & S0 & {inv_B}B) | (S1 & !S0 & {inv_C}C) | (S1 & S1 & {inv_D}D)", inputs=["S0", "S1", "A", "B", "C", "D"])


# build library
build_gate_with_expr("inv", 1, "!A")

build_gate("nand", True,  "&")
build_gate("nor",  True,  "|")
build_gate("and",  False, "&")
build_gate("or",   False, "|")

build_gate_with_config("nand",  7, 0, True,  "&")
build_gate_with_config("nand",  8, 0, True,  "&")
build_gate_with_config("nand", 13, 6, True,  "&")
build_gate_with_config("nand", 15, 6, True,  "&")
build_gate_with_config("nor",   7, 0, True,  "|")
build_gate_with_config("nor",   9, 5, True,  "|")
build_gate_with_config("nor",  14, 7, True,  "|")
build_gate_with_config("nor",  16, 9, True,  "|") # too big for ABC
build_gate_with_config("and",   7, 0, False, "&")
build_gate_with_config("and",   7, 1, False, "&")
build_gate_with_config("and",   8, 0, False, "&")
build_gate_with_config("and",   8, 1, False, "&")
build_gate_with_config("and",   9, 4, False, "&")
build_gate_with_config("and",  14, 7, False, "&")
build_gate_with_config("and",  16, 7, False, "&") # too big for ABC
build_gate_with_config("or",   13, 6, False, "|")
build_gate_with_config("or",   15, 8, False, "|")

build_gate_with_expr("xor2i0",  2, "(!A & B) | (A & !B)")
build_gate_with_expr("xor3i0",  3, "(!A & !B & C) | (!A & B & !C) | (A & !B & !C) | (A & B & C)")
build_gate_with_expr("xor4i0",  4, "(!A & !B & !C & D) | (!A & !B & C & !D) | (!A & B & !C & !D) | (!A & B & C & D) | (A & !B & !C & !D) | (A & !B & C & D) | (A & B & !C & D) | (A & B & C & !D)")

build_gate_with_expr("xnor2i0", 2, "(!A & !B) | (A & B)")
build_gate_with_expr("xnor3i0", 3, "(!A & !B & !C) | (!A & B & C) | (A & !B & C) | (A & B & !C)")

build_mux2()
build_mux4()

genlib.close()
simlib.close()
