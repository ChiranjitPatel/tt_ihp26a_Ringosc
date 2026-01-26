module tt_um_ro (
	input enable,
    output osc_out
);

    logic a, b, c;
    // (* keep = "true", dont_touch = "true" *) logic a, b, c;
    // wire startup = 1'b0;  // Constant 0
	
	nand X1 (a, c ,enable);
    // assign #2 a = startup ? 1'b0 : ~c;
    // assign #2 a = ~c;
    assign #100ps b = ~a;
    assign #100ps c = ~b;  // Forces c=0 only at start (but simplified)

	// pulldown (c);  // Weak pull-down to 0
    assign osc_out = c;

endmodule