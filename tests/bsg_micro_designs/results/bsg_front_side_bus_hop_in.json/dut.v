/* Generated by Yosys 0.27+9 (git sha1 101d19bb6, gcc 11.2.0-7ubuntu2 -fPIC -Os) */


module \$paramod$178264a5165c1cd104ffa6bfd64842c34001f91b\bsg_two_fifo (clk_i, reset_i, ready_o, data_i, v_i, v_o, data_o, yumi_i);
  wire _00_;
  wire _01_;
  wire _02_;
  wire _03_;
  wire _04_;
  wire _05_;
  wire _06_;
  
  wire _07_;
  
  wire _08_;
  
  wire _09_;
  
  wire _10_;
  
  input clk_i;
  wire clk_i;
  
  input [15:0] data_i;
  wire [15:0] data_i;
  
  output [15:0] data_o;
  wire [15:0] data_o;
  
  wire deq_i;
  
  reg empty_r;
  
  wire enq_i;
  
  reg full_r;
  
  reg head_r;
  
  output ready_o;
  wire ready_o;
  
  input reset_i;
  wire reset_i;
  
  reg tail_r;
  
  input v_i;
  wire v_i;
  
  output v_o;
  wire v_o;
  
  input yumi_i;
  wire yumi_i;
  assign _07_ = ~tail_r;
  assign _08_ = ~head_r;
  assign enq_i = v_i & ~(full_r);
  assign v_o = ~empty_r;
  assign ready_o = ~full_r;
  assign _00_ = empty_r & ~(enq_i);
  assign _01_ = full_r | ~(v_i);
  assign _02_ = full_r | ~(yumi_i);
  assign _03_ = _01_ & ~(_02_);
  assign _10_ = _03_ | _00_;
  assign _04_ = v_o & ~(_01_);
  assign _05_ = _04_ & ~(yumi_i);
  assign _06_ = full_r & ~(yumi_i);
  assign _09_ = _06_ | _05_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) full_r <= 1'h0;
    else full_r <= _09_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) head_r <= 1'h0;
    else if (yumi_i) head_r <= _08_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) tail_r <= 1'h0;
    else if (enq_i) tail_r <= _07_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) empty_r <= 1'h1;
    else empty_r <= _10_;
  (* module_not_derived = 32'd1 *)
  
  \$paramod$3a18e26df69586b9660058508f39e2fbcd072454\bsg_mem_1r1w  mem_1r1w (
    .r_addr_i(head_r),
    .r_data_o(data_o),
    .r_v_i(v_o),
    .w_addr_i(tail_r),
    .w_clk_i(clk_i),
    .w_data_i(data_i),
    .w_reset_i(reset_i),
    .w_v_i(enq_i)
  );
  assign deq_i = yumi_i;
endmodule


module \$paramod$3a18e26df69586b9660058508f39e2fbcd072454\bsg_mem_1r1w (w_clk_i, w_reset_i, w_v_i, w_addr_i, w_data_i, r_v_i, r_addr_i, r_data_o);
  
  input r_addr_i;
  wire r_addr_i;
  
  output [15:0] r_data_o;
  wire [15:0] r_data_o;
  
  input r_v_i;
  wire r_v_i;
  
  input w_addr_i;
  wire w_addr_i;
  
  input w_clk_i;
  wire w_clk_i;
  
  input [15:0] w_data_i;
  wire [15:0] w_data_i;
  
  input w_reset_i;
  wire w_reset_i;
  
  input w_v_i;
  wire w_v_i;
  (* module_not_derived = 32'd1 *)
  
  \$paramod$e79b8c4e6409b809f38f3196ee2cb80d3fcb268c\bsg_mem_1r1w_synth  synth (
    .r_addr_i(r_addr_i),
    .r_data_o(r_data_o),
    .r_v_i(r_v_i),
    .w_addr_i(w_addr_i),
    .w_clk_i(w_clk_i),
    .w_data_i(w_data_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i)
  );
endmodule


module \$paramod$e79b8c4e6409b809f38f3196ee2cb80d3fcb268c\bsg_mem_1r1w_synth (w_clk_i, w_reset_i, w_v_i, w_addr_i, w_data_i, r_v_i, r_addr_i, r_data_o);
  wire _00_;
  wire _01_;
  reg [15:0] \nz.mem[0] ;
  reg [15:0] \nz.mem[1] ;
  
  input r_addr_i;
  wire r_addr_i;
  
  output [15:0] r_data_o;
  wire [15:0] r_data_o;
  
  input r_v_i;
  wire r_v_i;
  
  (* unused_bits = "0" *)
  wire unused0;
  
  (* unused_bits = "0" *)
  wire unused1;
  
  input w_addr_i;
  wire w_addr_i;
  
  input w_clk_i;
  wire w_clk_i;
  
  input [15:0] w_data_i;
  wire [15:0] w_data_i;
  
  input w_reset_i;
  wire w_reset_i;
  
  input w_v_i;
  wire w_v_i;
  assign r_data_o[0] = r_addr_i ? \nz.mem[1] [0] : \nz.mem[0] [0];
  assign r_data_o[1] = r_addr_i ? \nz.mem[1] [1] : \nz.mem[0] [1];
  assign r_data_o[2] = r_addr_i ? \nz.mem[1] [2] : \nz.mem[0] [2];
  assign r_data_o[3] = r_addr_i ? \nz.mem[1] [3] : \nz.mem[0] [3];
  assign r_data_o[4] = r_addr_i ? \nz.mem[1] [4] : \nz.mem[0] [4];
  assign r_data_o[5] = r_addr_i ? \nz.mem[1] [5] : \nz.mem[0] [5];
  assign r_data_o[6] = r_addr_i ? \nz.mem[1] [6] : \nz.mem[0] [6];
  assign r_data_o[7] = r_addr_i ? \nz.mem[1] [7] : \nz.mem[0] [7];
  assign r_data_o[8] = r_addr_i ? \nz.mem[1] [8] : \nz.mem[0] [8];
  assign r_data_o[9] = r_addr_i ? \nz.mem[1] [9] : \nz.mem[0] [9];
  assign r_data_o[10] = r_addr_i ? \nz.mem[1] [10] : \nz.mem[0] [10];
  assign r_data_o[11] = r_addr_i ? \nz.mem[1] [11] : \nz.mem[0] [11];
  assign r_data_o[12] = r_addr_i ? \nz.mem[1] [12] : \nz.mem[0] [12];
  assign r_data_o[13] = r_addr_i ? \nz.mem[1] [13] : \nz.mem[0] [13];
  assign r_data_o[14] = r_addr_i ? \nz.mem[1] [14] : \nz.mem[0] [14];
  assign r_data_o[15] = r_addr_i ? \nz.mem[1] [15] : \nz.mem[0] [15];
  assign _00_ = w_v_i & ~(w_addr_i);
  assign _01_ = w_v_i & w_addr_i;
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [0] <= w_data_i[0];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [1] <= w_data_i[1];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [2] <= w_data_i[2];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [3] <= w_data_i[3];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [4] <= w_data_i[4];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [5] <= w_data_i[5];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [6] <= w_data_i[6];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [7] <= w_data_i[7];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [8] <= w_data_i[8];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [9] <= w_data_i[9];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [10] <= w_data_i[10];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [11] <= w_data_i[11];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [12] <= w_data_i[12];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [13] <= w_data_i[13];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [14] <= w_data_i[14];
  always @(posedge w_clk_i)
    if (_01_) \nz.mem[1] [15] <= w_data_i[15];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [0] <= w_data_i[0];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [1] <= w_data_i[1];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [2] <= w_data_i[2];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [3] <= w_data_i[3];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [4] <= w_data_i[4];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [5] <= w_data_i[5];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [6] <= w_data_i[6];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [7] <= w_data_i[7];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [8] <= w_data_i[8];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [9] <= w_data_i[9];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [10] <= w_data_i[10];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [11] <= w_data_i[11];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [12] <= w_data_i[12];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [13] <= w_data_i[13];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [14] <= w_data_i[14];
  always @(posedge w_clk_i)
    if (_00_) \nz.mem[0] [15] <= w_data_i[15];
  assign unused0 = w_reset_i;
  assign unused1 = r_v_i;
endmodule

(* top =  1  *)

module bsg_front_side_bus_hop_in(clk_i, reset_i, ready_o, v_i, data_i, v_o, data_o, ready_i);
  
  wire _00_;
  
  wire _01_;
  
  wire _02_;
  
  wire _03_;
  
  wire _04_;
  wire _05_;
  wire _06_;
  wire _07_;
  wire _08_;
  wire _09_;
  wire _10_;
  wire _11_;
  wire _12_;
  wire _13_;
  wire _14_;
  wire _15_;
  wire _16_;
  wire _17_;
  wire _18_;
  wire _19_;
  wire _20_;
  wire _21_;
  wire _22_;
  
  input clk_i;
  wire clk_i;
  
  input [15:0] data_i;
  wire [15:0] data_i;
  
  output [79:0] data_o;
  wire [79:0] data_o;
  
  wire [15:0] data_o_tmp;
  
  wire fifo_v;
  
  wire fifo_yumi;
  
  input [4:0] ready_i;
  wire [4:0] ready_i;
  
  output ready_o;
  wire ready_o;
  
  input reset_i;
  wire reset_i;
  
  reg [4:0] sent_r;
  
  input v_i;
  wire v_i;
  
  output [4:0] v_o;
  wire [4:0] v_o;
  
  wire [4:0] v_o_tmp;
  assign _05_ = sent_r[0] | ~(fifo_v);
  assign _06_ = ready_i[0] & ~(_05_);
  assign _07_ = _06_ | sent_r[0];
  assign _08_ = sent_r[1] | ~(fifo_v);
  assign _09_ = _08_ | ~(ready_i[1]);
  assign _10_ = _09_ & ~(sent_r[1]);
  assign _11_ = _07_ & ~(_10_);
  assign _12_ = sent_r[2] | ~(fifo_v);
  assign _13_ = ready_i[2] & ~(_12_);
  assign _14_ = _13_ | sent_r[2];
  assign _15_ = sent_r[3] | ~(fifo_v);
  assign _16_ = ready_i[3] & ~(_15_);
  assign _17_ = _16_ | sent_r[3];
  assign _18_ = ~(_17_ & _14_);
  assign _19_ = _11_ & ~(_18_);
  assign _20_ = sent_r[4] | ~(fifo_v);
  assign _21_ = _20_ | ~(ready_i[4]);
  assign _22_ = _21_ & ~(sent_r[4]);
  assign fifo_yumi = _19_ & ~(_22_);
  assign v_o[0] = ~_05_;
  assign _00_ = _07_ & ~(fifo_yumi);
  assign v_o[1] = ~_08_;
  assign _01_ = ~(fifo_yumi | _10_);
  assign v_o[2] = ~_12_;
  assign _02_ = _14_ & ~(fifo_yumi);
  assign v_o[3] = ~_15_;
  assign _03_ = _17_ & ~(fifo_yumi);
  assign v_o[4] = ~_20_;
  assign _04_ = ~(_22_ | _19_);
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) sent_r[4] <= 1'h0;
    else sent_r[4] <= _04_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) sent_r[3] <= 1'h0;
    else sent_r[3] <= _03_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) sent_r[2] <= 1'h0;
    else sent_r[2] <= _02_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) sent_r[1] <= 1'h0;
    else sent_r[1] <= _01_;
  (* \always_ff  = 32'd1 *)
  
  always @(posedge clk_i)
    if (reset_i) sent_r[0] <= 1'h0;
    else sent_r[0] <= _00_;
  (* module_not_derived = 32'd1 *)
  
  \$paramod$178264a5165c1cd104ffa6bfd64842c34001f91b\bsg_two_fifo  fifo (
    .clk_i(clk_i),
    .data_i(data_i),
    .data_o(data_o_tmp),
    .ready_o(ready_o),
    .reset_i(reset_i),
    .v_i(v_i),
    .v_o(fifo_v),
    .yumi_i(fifo_yumi)
  );
  assign data_o = { data_o_tmp, data_o_tmp, data_o_tmp, data_o_tmp, data_o_tmp };
  assign v_o_tmp = v_o;
endmodule
