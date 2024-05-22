`include "ip_packet_gen.sv";
`include "ip_packet_chk.sv";

`timescale 1 ns/ 1 ns;

	

module tb_top;
	IP_packet_gen 	packet_gen;
	IP_packet_chk 	packet_chk;
	bit [31:0]		packet_data;
	bit [3:0]		packet_strobe;
	bit				packet_last;
	
	reg				clk;
	reg				rst;
	
	
	initial begin
		clk			= 1'b0;
		
		packet_gen = new("/home/jung/IP_gen_chk/data/config.ini");
		packet_chk = new();
		
		
		
		
/*		
		for (int j = 0 ; j < 100 ; j++) begin
			packet_gen = new(64+j,j);
			packet_chk = new(j);
			for (int i = 0 ; i <packet_gen.lgth ; i=i+4) begin
				packet_gen.rd_data32(packet_data,packet_strobe,packet_last);
//				$display ("data[%02h] = 0x%08h, strobe =0b%04b, last =1b%b", i, packet_data, packet_strobe,packet_last);
				packet_chk.wr_data32(packet_data,packet_strobe,packet_last);
			end
		end
*/		
		
	end
	
	always begin
		packet_gen.rd_data32(packet_data,packet_strobe,packet_last);
		$display ("data[%02h] = 0x%08h, strobe =0b%04b, last =1b%b", packet_gen.pointer, packet_data, packet_strobe,packet_last);
		packet_chk.wr_data32(packet_data,packet_strobe,packet_last);
	end
	
/*
	always begin
		#5	clk	= 1'b1;
		#5	clk = 1'b0;
	end
	
	
	initial begin
				rst = 1'b1;
		#100	rst = 1'b0;
	end
	
reg [31:0]		M_AXIS_0_tdata		;
reg [0:0]		M_AXIS_0_tdest     =1'b0 ;
reg [0:0]		M_AXIS_0_tid       =1'b0 ;
reg [0:0]		M_AXIS_0_tlast      ;
wire [0:0]		M_AXIS_0_tready     ;
reg [3:0]		M_AXIS_0_tstrb      ;
reg [0:0]		M_AXIS_0_tvalid     ;

input [31:0]	S_AXIS_0_tdata      ;
input [0:0]		S_AXIS_0_tdest      ;
input [0:0]		S_AXIS_0_tid        ;
input [0:0]		S_AXIS_0_tlast      ;
output [0:0]	S_AXIS_0_tready     ;
input [3:0]		S_AXIS_0_tstrb      ;
input [0:0]		S_AXIS_0_tvalid     ;

	
axis_loop U_axis_loop (
.M_AXIS_0_tdata			(M_AXIS_0_tdata			),
.M_AXIS_0_tdest         (M_AXIS_0_tdest         ),
.M_AXIS_0_tid           (M_AXIS_0_tid           ),
.M_AXIS_0_tlast         (M_AXIS_0_tlast         ),
.M_AXIS_0_tready        (M_AXIS_0_tready        ),
.M_AXIS_0_tstrb         (M_AXIS_0_tstrb         ),
.M_AXIS_0_tvalid        (M_AXIS_0_tvalid        ),
.S_AXIS_0_tdata         (S_AXIS_0_tdata         ),
.S_AXIS_0_tdest         (S_AXIS_0_tdest         ),
.S_AXIS_0_tid           (S_AXIS_0_tid           ),
.S_AXIS_0_tlast         (S_AXIS_0_tlast         ),
.S_AXIS_0_tready        (S_AXIS_0_tready        ),
.S_AXIS_0_tstrb         (S_AXIS_0_tstrb         ),
.S_AXIS_0_tvalid        (S_AXIS_0_tvalid        ),
.aclk_0                 (clk                    ),
.aresetn_0              (rst                    )
);

always @ (posedge rst and posedge clk)
		if (rst)
			begin
			M_AXIS_0_tdata	<=32'b0;
			M_AXIS_0_tlast	<=1'b0;
			M_AXIS_0_tstrb	<=4'b0;
			M_AXIS_0_tvalid	<=1'b0;
			end			
		else if (M_AXIS_0_tready)
			begin
			
			end


*/
endmodule