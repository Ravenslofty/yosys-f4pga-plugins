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

module \$alu (A, B, CI, BI, X, Y, CO);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 1;
parameter B_WIDTH = 1;
parameter Y_WIDTH = 1;

(* force_downto *)
input [A_WIDTH-1:0] A;
(* force_downto *)
input [B_WIDTH-1:0] B;
(* force_downto *)
output [Y_WIDTH-1:0] X, Y;

input CI, BI;
(* force_downto *)
output [Y_WIDTH-1:0] CO;

wire _TECHMAP_FAIL_ = Y_WIDTH <= 2;

(* force_downto *)
wire [Y_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

(* force_downto *)
wire [Y_WIDTH-1:0] AA = A_buf;
(* force_downto *)
wire [Y_WIDTH-1:0] BB = BI ? ~B_buf : B_buf;
(* force_downto *)
wire [Y_WIDTH-1:0] C = {CO, CI};

genvar i;
generate for (i = 0; i < Y_WIDTH; i = i + 1) begin:slice
    fadd1_p2 carry (
        .S(Y[i]),
        .CO(CO[i]),
        .A(AA[i]),
        .B(BB[i]),
        .CI(C[i])
    );
end endgenerate

assign X = AA ^ BB;

endmodule
