.data
.text
.globl main

main:
 li t0, 0x00000000 # Loading the base address of switch input.
 li t1, 0x00000004 # Loading the base address of the led input.
 
InputWait:
 lw t2, 0(t0) # Load the current switch value from into t2.
 beq t2, x0, InputWait # Maintain the state if switch value == 0.
 add a0, t2, x0 # Adding the switch value into a0.
 jal ra, Countdown # Jump to the label countdown.
 jal x0, InputWait # After the countdown finishes, jump back to the waiting for input state.
 
Countdown:
 addi sp, sp, -8 # Allocating stack space.
 sw ra, 4(sp) # Storing return address.
 sw s0, 0(sp) # Storing for counter.
 add s0, a0, x0 # Initialise the counter using switch value added into a0.
 
CountLoop:
 sw s0, 0(t1) # Output the current counter values to the leds.
 beq s0, x0, Done # Check if the counter reaches 0 at which exit countdown.
 addi s0, s0, -1 # Decrement the counter.
 jal ra, Delay # Jumping to delay to slow down the changes in leds
 jal x0, CountLoop # Returning to the caller.
 
Done:
 sw x0, 0(t1) # Clearing LEDs.
 lw s0, 0(sp) # Restoring s0 which was for counter
 lw ra, 4(sp) # Restoring return address
 addi sp, sp, 8 # Deallocating the stack space
 jalr x0, ra, 0 # return
 
Delay:
 li t3, 1000 # Accounting for delay to allow for LEDS change to be visible.
 
DelayLoop:
 addi t3, t3, -1 # Decrement the delay counter
 bne t3, x0, DelayLoop # If counter != 0, continue to delay each loop
 jalr x0, ra, 0 # Returning to the  caller
