`timescale 1ns / 1ps

module instructionMemoryTestBench;

reg [31:0] instAddress;
wire [31:0] instruction;

// Instantiate DUT
instructionMemory uut (
    .instAddress(instAddress),
    .instruction(instruction)
);

initial begin
    // Start at address 0
    instAddress = 0;

    // Step through instructions
    #10 instAddress = 0;
    #10 instAddress = 4;
    #10 instAddress = 8;
    #10 instAddress = 12;
    #10 instAddress = 16;
    #10 instAddress = 20;
    #10 instAddress = 24;
    #10 instAddress = 28;
    #10 instAddress = 32;
    #10 instAddress = 36;
    #10 instAddress = 40;
    #10 instAddress = 44;
    #10 instAddress = 48;
    #10 instAddress = 52;
    #10 instAddress = 56;
    #10 instAddress = 60;

    $stop;
end

endmodule
