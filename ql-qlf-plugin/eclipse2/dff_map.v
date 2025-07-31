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

module \$_DFF_P_ (input C, D, output Q);
dff _TECHMAP_REPLACE_ (.Q(Q), .D(D), .CLK(C));
endmodule

module \$_DFF_PP0_ (input C, D, R, output Q);
dffc _TECHMAP_REPLACE_ (.Q(Q), .D(D), .CLK(C), .CLR(R));
endmodule

module \$_DFF_PP1_ (input C, D, R, output Q);
dffp _TECHMAP_REPLACE_ (.Q(Q), .D(D), .CLK(C), .PRE(R));
endmodule

module \$_DFFSR_PPP_ (input C, S, R, D, output Q);
dffpc _TECHMAP_REPLACE_ (.Q(Q), .D(D), .CLK(C), .CLR(R), .PRE(S));
endmodule

module \$_DLATCH_P_ (input E, D, output Q);
dla _TECHMAP_REPLACE_ (.Q(Q), .D(D), .G(E));
endmodule

module \$_DLATCH_PP0_ (input E, D, R, output Q);
dlac _TECHMAP_REPLACE_ (.Q(Q), .D(D), .G(E), .CLR(R));
endmodule

module \$_DLATCH_PP1_ (input E, D, R, output Q);
dlap _TECHMAP_REPLACE_ (.Q(Q), .D(D), .G(E), .PRE(R));
endmodule
