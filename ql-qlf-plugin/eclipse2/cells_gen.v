module inv (input A, output Q);
assign Q = !A;
endmodule

module nand2i0 (input A, input B, output Q);
assign Q = !(A & B);
endmodule

module nand2i1 (input A, input B, output Q);
assign Q = !(A & !B);
endmodule

module nand2i2 (input A, input B, output Q);
assign Q = !(!A & !B);
endmodule

module nand3i0 (input A, input B, input C, output Q);
assign Q = !(A & B & C);
endmodule

module nand3i1 (input A, input B, input C, output Q);
assign Q = !(A & B & !C);
endmodule

module nand3i2 (input A, input B, input C, output Q);
assign Q = !(A & !B & !C);
endmodule

module nand3i3 (input A, input B, input C, output Q);
assign Q = !(!A & !B & !C);
endmodule

module nand4i0 (input A, input B, input C, input D, output Q);
assign Q = !(A & B & C & D);
endmodule

module nand4i1 (input A, input B, input C, input D, output Q);
assign Q = !(A & B & C & !D);
endmodule

module nand4i2 (input A, input B, input C, input D, output Q);
assign Q = !(A & B & !C & !D);
endmodule

module nand4i3 (input A, input B, input C, input D, output Q);
assign Q = !(A & !B & !C & !D);
endmodule

module nand4i4 (input A, input B, input C, input D, output Q);
assign Q = !(!A & !B & !C & !D);
endmodule

module nand5i0 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A & B & C & D & E);
endmodule

module nand5i1 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A & B & C & D & !E);
endmodule

module nand5i2 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A & B & C & !D & !E);
endmodule

module nand5i3 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A & B & !C & !D & !E);
endmodule

module nand5i4 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A & !B & !C & !D & !E);
endmodule

module nand5i5 (input A, input B, input C, input D, input E, output Q);
assign Q = !(!A & !B & !C & !D & !E);
endmodule

module nand6i0 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A & B & C & D & E & F);
endmodule

module nand6i1 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A & B & C & D & E & !F);
endmodule

module nand6i2 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A & B & C & D & !E & !F);
endmodule

module nand6i3 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A & B & C & !D & !E & !F);
endmodule

module nand6i4 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A & B & !C & !D & !E & !F);
endmodule

module nand6i5 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A & !B & !C & !D & !E & !F);
endmodule

module nand6i6 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(!A & !B & !C & !D & !E & !F);
endmodule

module nor2i0 (input A, input B, output Q);
assign Q = !(A | B);
endmodule

module nor2i1 (input A, input B, output Q);
assign Q = !(A | !B);
endmodule

module nor2i2 (input A, input B, output Q);
assign Q = !(!A | !B);
endmodule

module nor3i0 (input A, input B, input C, output Q);
assign Q = !(A | B | C);
endmodule

module nor3i1 (input A, input B, input C, output Q);
assign Q = !(A | B | !C);
endmodule

module nor3i2 (input A, input B, input C, output Q);
assign Q = !(A | !B | !C);
endmodule

module nor3i3 (input A, input B, input C, output Q);
assign Q = !(!A | !B | !C);
endmodule

module nor4i0 (input A, input B, input C, input D, output Q);
assign Q = !(A | B | C | D);
endmodule

module nor4i1 (input A, input B, input C, input D, output Q);
assign Q = !(A | B | C | !D);
endmodule

module nor4i2 (input A, input B, input C, input D, output Q);
assign Q = !(A | B | !C | !D);
endmodule

module nor4i3 (input A, input B, input C, input D, output Q);
assign Q = !(A | !B | !C | !D);
endmodule

module nor4i4 (input A, input B, input C, input D, output Q);
assign Q = !(!A | !B | !C | !D);
endmodule

module nor5i0 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A | B | C | D | E);
endmodule

module nor5i1 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A | B | C | D | !E);
endmodule

module nor5i2 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A | B | C | !D | !E);
endmodule

module nor5i3 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A | B | !C | !D | !E);
endmodule

module nor5i4 (input A, input B, input C, input D, input E, output Q);
assign Q = !(A | !B | !C | !D | !E);
endmodule

module nor5i5 (input A, input B, input C, input D, input E, output Q);
assign Q = !(!A | !B | !C | !D | !E);
endmodule

module nor6i0 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A | B | C | D | E | F);
endmodule

module nor6i1 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A | B | C | D | E | !F);
endmodule

module nor6i2 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A | B | C | D | !E | !F);
endmodule

module nor6i3 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A | B | C | !D | !E | !F);
endmodule

module nor6i4 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A | B | !C | !D | !E | !F);
endmodule

module nor6i5 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(A | !B | !C | !D | !E | !F);
endmodule

module nor6i6 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = !(!A | !B | !C | !D | !E | !F);
endmodule

module and2i0 (input A, input B, output Q);
assign Q = (A & B);
endmodule

module and2i1 (input A, input B, output Q);
assign Q = (A & !B);
endmodule

module and2i2 (input A, input B, output Q);
assign Q = (!A & !B);
endmodule

module and3i0 (input A, input B, input C, output Q);
assign Q = (A & B & C);
endmodule

module and3i1 (input A, input B, input C, output Q);
assign Q = (A & B & !C);
endmodule

module and3i2 (input A, input B, input C, output Q);
assign Q = (A & !B & !C);
endmodule

module and3i3 (input A, input B, input C, output Q);
assign Q = (!A & !B & !C);
endmodule

module and4i0 (input A, input B, input C, input D, output Q);
assign Q = (A & B & C & D);
endmodule

module and4i1 (input A, input B, input C, input D, output Q);
assign Q = (A & B & C & !D);
endmodule

module and4i2 (input A, input B, input C, input D, output Q);
assign Q = (A & B & !C & !D);
endmodule

module and4i3 (input A, input B, input C, input D, output Q);
assign Q = (A & !B & !C & !D);
endmodule

module and4i4 (input A, input B, input C, input D, output Q);
assign Q = (!A & !B & !C & !D);
endmodule

module and5i0 (input A, input B, input C, input D, input E, output Q);
assign Q = (A & B & C & D & E);
endmodule

module and5i1 (input A, input B, input C, input D, input E, output Q);
assign Q = (A & B & C & D & !E);
endmodule

module and5i2 (input A, input B, input C, input D, input E, output Q);
assign Q = (A & B & C & !D & !E);
endmodule

module and5i3 (input A, input B, input C, input D, input E, output Q);
assign Q = (A & B & !C & !D & !E);
endmodule

module and5i4 (input A, input B, input C, input D, input E, output Q);
assign Q = (A & !B & !C & !D & !E);
endmodule

module and5i5 (input A, input B, input C, input D, input E, output Q);
assign Q = (!A & !B & !C & !D & !E);
endmodule

module and6i0 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A & B & C & D & E & F);
endmodule

module and6i1 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A & B & C & D & E & !F);
endmodule

module and6i2 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A & B & C & D & !E & !F);
endmodule

module and6i3 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A & B & C & !D & !E & !F);
endmodule

module and6i4 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A & B & !C & !D & !E & !F);
endmodule

module and6i5 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A & !B & !C & !D & !E & !F);
endmodule

module and6i6 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (!A & !B & !C & !D & !E & !F);
endmodule

module or2i0 (input A, input B, output Q);
assign Q = (A | B);
endmodule

module or2i1 (input A, input B, output Q);
assign Q = (A | !B);
endmodule

module or2i2 (input A, input B, output Q);
assign Q = (!A | !B);
endmodule

module or3i0 (input A, input B, input C, output Q);
assign Q = (A | B | C);
endmodule

module or3i1 (input A, input B, input C, output Q);
assign Q = (A | B | !C);
endmodule

module or3i2 (input A, input B, input C, output Q);
assign Q = (A | !B | !C);
endmodule

module or3i3 (input A, input B, input C, output Q);
assign Q = (!A | !B | !C);
endmodule

module or4i0 (input A, input B, input C, input D, output Q);
assign Q = (A | B | C | D);
endmodule

module or4i1 (input A, input B, input C, input D, output Q);
assign Q = (A | B | C | !D);
endmodule

module or4i2 (input A, input B, input C, input D, output Q);
assign Q = (A | B | !C | !D);
endmodule

module or4i3 (input A, input B, input C, input D, output Q);
assign Q = (A | !B | !C | !D);
endmodule

module or4i4 (input A, input B, input C, input D, output Q);
assign Q = (!A | !B | !C | !D);
endmodule

module or5i0 (input A, input B, input C, input D, input E, output Q);
assign Q = (A | B | C | D | E);
endmodule

module or5i1 (input A, input B, input C, input D, input E, output Q);
assign Q = (A | B | C | D | !E);
endmodule

module or5i2 (input A, input B, input C, input D, input E, output Q);
assign Q = (A | B | C | !D | !E);
endmodule

module or5i3 (input A, input B, input C, input D, input E, output Q);
assign Q = (A | B | !C | !D | !E);
endmodule

module or5i4 (input A, input B, input C, input D, input E, output Q);
assign Q = (A | !B | !C | !D | !E);
endmodule

module or5i5 (input A, input B, input C, input D, input E, output Q);
assign Q = (!A | !B | !C | !D | !E);
endmodule

module or6i0 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A | B | C | D | E | F);
endmodule

module or6i1 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A | B | C | D | E | !F);
endmodule

module or6i2 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A | B | C | D | !E | !F);
endmodule

module or6i3 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A | B | C | !D | !E | !F);
endmodule

module or6i4 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A | B | !C | !D | !E | !F);
endmodule

module or6i5 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (A | !B | !C | !D | !E | !F);
endmodule

module or6i6 (input A, input B, input C, input D, input E, input F, output Q);
assign Q = (!A | !B | !C | !D | !E | !F);
endmodule

module nand7i0 (input A, input B, input C, input D, input E, input F, input G, output Q);
assign Q = !(A & B & C & D & E & F & G);
endmodule

module nand8i0 (input A, input B, input C, input D, input E, input F, input G, input H, output Q);
assign Q = !(A & B & C & D & E & F & G & H);
endmodule

module nand13i6 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, output Q);
assign Q = !(A & B & C & D & E & F & G & !H & !I & !J & !K & !L & !M);
endmodule

module nand15i6 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, input N, input O, output Q);
assign Q = !(A & B & C & D & E & F & G & H & I & !J & !K & !L & !M & !N & !O);
endmodule

module nor7i0 (input A, input B, input C, input D, input E, input F, input G, output Q);
assign Q = !(A | B | C | D | E | F | G);
endmodule

module nor9i5 (input A, input B, input C, input D, input E, input F, input G, input H, input I, output Q);
assign Q = !(A | B | C | D | !E | !F | !G | !H | !I);
endmodule

module nor14i7 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, input N, output Q);
assign Q = !(A | B | C | D | E | F | G | !H | !I | !J | !K | !L | !M | !N);
endmodule

module nor16i9 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, input N, input O, input P, output Q);
assign Q = !(A | B | C | D | E | F | G | !H | !I | !J | !K | !L | !M | !N | !O | !P);
endmodule

module and7i0 (input A, input B, input C, input D, input E, input F, input G, output Q);
assign Q = (A & B & C & D & E & F & G);
endmodule

module and7i1 (input A, input B, input C, input D, input E, input F, input G, output Q);
assign Q = (A & B & C & D & E & F & !G);
endmodule

module and8i0 (input A, input B, input C, input D, input E, input F, input G, input H, output Q);
assign Q = (A & B & C & D & E & F & G & H);
endmodule

module and8i1 (input A, input B, input C, input D, input E, input F, input G, input H, output Q);
assign Q = (A & B & C & D & E & F & G & !H);
endmodule

module and9i4 (input A, input B, input C, input D, input E, input F, input G, input H, input I, output Q);
assign Q = (A & B & C & D & E & !F & !G & !H & !I);
endmodule

module and14i7 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, input N, output Q);
assign Q = (A & B & C & D & E & F & G & !H & !I & !J & !K & !L & !M & !N);
endmodule

module and16i7 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, input N, input O, input P, output Q);
assign Q = (A & B & C & D & E & F & G & H & I & !J & !K & !L & !M & !N & !O & !P);
endmodule

module or13i6 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, output Q);
assign Q = (A | B | C | D | E | F | G | !H | !I | !J | !K | !L | !M);
endmodule

module or15i8 (input A, input B, input C, input D, input E, input F, input G, input H, input I, input J, input K, input L, input M, input N, input O, output Q);
assign Q = (A | B | C | D | E | F | G | !H | !I | !J | !K | !L | !M | !N | !O);
endmodule

module xor2i0 (input A, input B, output Q);
assign Q = (!A & B) | (A & !B);
endmodule

module xor3i0 (input A, input B, input C, output Q);
assign Q = (!A & !B & C) | (!A & B & !C) | (A & !B & !C) | (A & B & C);
endmodule

module xor4i0 (input A, input B, input C, input D, output Q);
assign Q = (!A & !B & !C & D) | (!A & !B & C & !D) | (!A & B & !C & !D) | (!A & B & C & D) | (A & !B & !C & !D) | (A & !B & C & D) | (A & B & !C & D) | (A & B & C & !D);
endmodule

module xnor2i0 (input A, input B, output Q);
assign Q = (!A & !B) | (A & B);
endmodule

module xnor3i0 (input A, input B, input C, output Q);
assign Q = (!A & !B & !C) | (!A & B & C) | (A & !B & C) | (A & B & !C);
endmodule

module mux2x0 (input S, input A, input B, output Q);
assign Q = (!S & A) | (S & B);
endmodule

module mux2x1 (input S, input A, input B, output Q);
assign Q = (!S & !A) | (S & B);
endmodule

module mux2x2 (input S, input A, input B, output Q);
assign Q = (!S & A) | (S & !B);
endmodule

module mux2x3 (input S, input A, input B, output Q);
assign Q = (!S & !A) | (S & !B);
endmodule

module mux4x0 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & B) | (S1 & !S0 & C) | (S1 & S1 & D);
endmodule

module mux4x1 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & B) | (S1 & !S0 & C) | (S1 & S1 & D);
endmodule

module mux4x2 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & !B) | (S1 & !S0 & C) | (S1 & S1 & D);
endmodule

module mux4x3 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & !B) | (S1 & !S0 & C) | (S1 & S1 & D);
endmodule

module mux4x4 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & B) | (S1 & !S0 & !C) | (S1 & S1 & D);
endmodule

module mux4x5 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & B) | (S1 & !S0 & !C) | (S1 & S1 & D);
endmodule

module mux4x6 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & !B) | (S1 & !S0 & !C) | (S1 & S1 & D);
endmodule

module mux4x7 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & !B) | (S1 & !S0 & !C) | (S1 & S1 & D);
endmodule

module mux4x8 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & B) | (S1 & !S0 & C) | (S1 & S1 & !D);
endmodule

module mux4x9 (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & B) | (S1 & !S0 & C) | (S1 & S1 & !D);
endmodule

module mux4xa (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & !B) | (S1 & !S0 & C) | (S1 & S1 & !D);
endmodule

module mux4xb (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & !B) | (S1 & !S0 & C) | (S1 & S1 & !D);
endmodule

module mux4xc (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & B) | (S1 & !S0 & !C) | (S1 & S1 & !D);
endmodule

module mux4xd (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & B) | (S1 & !S0 & !C) | (S1 & S1 & !D);
endmodule

module mux4xe (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & A) | (!S1 & S0 & !B) | (S1 & !S0 & !C) | (S1 & S1 & !D);
endmodule

module mux4xf (input S0, input S1, input A, input B, input C, input D, output Q);
assign Q = (!S1 & !S0 & !A) | (!S1 & S0 & !B) | (S1 & !S0 & !C) | (S1 & S1 & !D);
endmodule
