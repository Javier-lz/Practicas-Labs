# This program will continuously read from STDIN and print
# the first character from the read buffer.

.data
prompt1: .string "\nEnter character "
prompt2: .string "\nCharacter was "
end_value: .string "s" 
buffer:  .zero 255

.text
readLoop:
  li a7 4
  la a0 prompt1
  ecall
  call getChar
  mv t0 a0
  li a7 4
  la a0 prompt2
  ecall
  mv a0 t0
 
  
  li a7 11
  ecall
  lw a1 end_value
  andi a1 a1 255
  beq t0 a1 end
  j readLoop

getChar:
  # Use syscall "read" on file descriptor 0 (stdin)
  li a7 63
  li a0 0
  la a1 buffer
  li a2 255
  ecall
  # Read the first word of the buffer
  lw a0 0 a1
  # Mask the first char and return it
  andi a0 a0 255
  ret

end:
    nop
