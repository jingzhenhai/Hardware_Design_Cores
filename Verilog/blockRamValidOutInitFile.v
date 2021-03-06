`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:37 07/14/2009 
// Design Name: 
// Module Name:    memoryTest 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module blockRamInitFile(clock, address, dataOut); 

parameter blockLength = 32;
parameter memDepth = 64;
parameter addressBitWidth = 6;
parameter file = "meminit.data";

    input  clock; 
    input  [addressBitWidth-1:0] address; 
    output reg [blockLength-1:0] dataOut; 
    reg [blockLength-1:0] ram [0:memDepth-1]; 
	output reg valid = 0;
	
    initial
    begin
        $readmemb("meminit.data",ram);
    end
	 
    always @(posedge clock) 
    begin 
        dataOut <= ram[address];
		valid = 1;
    end
   
endmodule

