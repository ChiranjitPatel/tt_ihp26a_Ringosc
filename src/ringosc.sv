module ringosc (
	input enable,
    output osc_out
);
    
    /* verilator lint_off UNOPTFLAT */
	(* keep, allow_combinational_loops *)
    (* keep, keep_hierarchy *) wire a, b, c;
    /* verilator lint_on UNOPTFLAT */
	
    // (* keep = "true", dont_touch = "true" *) logic a, b, c;
    // wire startup = 1'b0;  // Constant 0
	
	//nand X1 (a, c ,enable);
	assign a = !(c & enable);
    // assign #2 a = startup ? 1'b0 : ~c;
    // assign #2 a = ~c;
    assign b = ~a;
    assign c = ~b; 

	// pulldown (c);  // Weak pull-down to 0
    assign osc_out = c;

endmodule