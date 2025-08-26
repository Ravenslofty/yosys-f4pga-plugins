// Copyright 2020-2022 F4PGA Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module inpad (
  output Q,
  (* iopad_external_pin *)
  input P
);
  specify
    (P => Q) = 0;
  endspecify
  assign Q = P;
endmodule

module outpad (
  (* iopad_external_pin *)
  output P,
  input A
);
  specify
    (A => P) = 0;
  endspecify
  assign P = A;
endmodule

module ckpad (
  output Q,
  (* iopad_external_pin *)
  input P
);
  specify
    (P => Q) = 0;
  endspecify
  assign Q = P;
endmodule

module bipad (
  input A,
  input EN,
  output Q,
  (* iopad_external_pin *)
  inout P
);
  assign Q = P;
  assign P = EN ? A : 1'bz;
endmodule

module dff (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input CLK
);
  initial Q = 1'b0;
  always @(posedge CLK) Q <= D;
endmodule

module dffc (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input CLK,
  (* clkbuf_sink *)
  input CLR
);
  initial Q = 1'b0;

  always @(posedge CLK or posedge CLR)
    if (CLR) Q <= 1'b0;
    else Q <= D;
endmodule

module dffp (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input CLK,
  (* clkbuf_sink *)
  input PRE
);
  initial Q = 1'b0;

  always @(posedge CLK or posedge PRE)
    if (PRE) Q <= 1'b1;
    else Q <= D;
endmodule

module dffpc (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input CLK,
  (* clkbuf_sink *)
  input CLR,
  (* clkbuf_sink *)
  input PRE
);
initial Q = 1'b0;

always @(posedge CLK or posedge CLR or posedge PRE)
    if (CLR) Q <= 1'b0;
    else if (PRE) Q <= 1'b1;
    else Q <= D;
endmodule

module dla (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input G
);
  always @* 
      if (G) Q = D;
endmodule

module dlac (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input G,
  (* clkbuf_sink *)
  input CLR
);
  always @* 
      if (CLR) Q = 1'b0;
      else if (G) Q = D;
endmodule

module dlap (
  output reg Q,
  input D,
  (* clkbuf_sink *)
  input G,
  (* clkbuf_sink *)
  input PRE
);
  always @* 
      if (PRE) Q = 1'b1;
      else if (G) Q = D;
endmodule

module shft4 (
  output reg [3:0] Q,
  (* clkbuf_sink *)
  input SI,
  (* clkbuf_sink *)
  input CLK,
  (* clkbuf_sink *)
  input CLR,
  (* clkbuf_sink *)
  input [3:0] D,
  (* clkbuf_sink *)
  input EN,
  (* clkbuf_sink *)
  input LOAD
);
initial Q = 4'b0;

always @(posedge CLK or posedge CLR)
  if (CLR) Q <= 4'b0;
  else if (LOAD) Q <= D;
  else if (EN) Q <= {Q[2:0], SI};
endmodule

module fadd1_p2 (
  output S,
  output CO,
  input A,
  input B,
  input CI
);
  assign {CO, S} = A + B + CI;
endmodule

module logic_0 (
  output A
);
  assign A = 1'b0;
endmodule

module logic_1 (
  output A
);
  assign A = 1'b1;
endmodule
