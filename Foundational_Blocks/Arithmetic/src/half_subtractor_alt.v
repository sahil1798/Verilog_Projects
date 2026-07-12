module half_subtractor(input a,b, output diff, borrow);

wire w1;

xor x1(diff,a,b);

not n1(w1,a);

and a1(borrow,w1,b);


endmodule