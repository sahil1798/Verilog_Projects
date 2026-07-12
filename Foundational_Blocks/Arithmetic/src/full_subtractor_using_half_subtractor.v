
module full_subtractor_using_half_subtractor(input a_fs,b_fs,bin_fs, output diff_fs,bout_fs);

wire w1,w2,w3;

half_subtractor hs1(.a(a_fs),.b(b_fs),.diff(w1),.borrow(w2));
half_subtractor hs2(.a(w1),.b(bin_fs),.diff(diff_fs),.borrow(w3));

or o1(bout_fs,w2,w3);

endmodule
