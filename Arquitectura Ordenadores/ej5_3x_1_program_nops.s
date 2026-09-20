.data 
 array: .word 5, -2, 0, 7, 3, -1, 4, 8
 out_array: .word 0,0,0,0,0,0,0,0
 accumul: .word 0
 size: .word 8
.text

main: 
    
    auipc a1, 0x10000
    xor a2,a2,a2
     xor a3,a3,a3
     lw a1, 0x44(a1)
    auipc x10 0x10000
  
    auipc x14 0x10000
    
 
    nop
    addi a0,a0,-20
    addi a4,a4,8

    
    
   
    

    
bucle: 
    addi a2,a2,1
    
    addi a0,a0,4
    addi a4,a4,4
    
    
    
    jal function 
    bne a1, a2, bucle 
    la t1, accumul
    auipc t1,0x10000
    
    nop
    nop
 
    sw a3, 0(t1) 
    
exit: 
    li a7, 10 
    nop
    nop
    nop
    ecall 
 
#Función con a0 puntero al elemento,a4: puntero a out a3: accumul. 
function: 
  
  lw t1, 0(a0) 
  nop
  nop
  ble t1, zero, zero_v 
  li t3,3 
  nop
  nop
  mul t1,t1,t3
  nop
  nop
  addi t1, t1,1 
  nop
  nop
  sw t1, 0(a4)
  nop
  nop
  nop
  add a3,a3,t1 
  
  
zero_v: 
    ret


    