module full_subtractor(input a,b,bin, output diff,bout);


wire w1,w2,w3,w4,w5;
xor x1(w1,a,b);
xor x2(diff,w1,bin);

not n1(w2,a);
and a1(w3,w2,b);

and a2(w4,w2,bin);

and a3(w5,b,bin);

or o1(bout,w3,w4,w5);



endmodule
