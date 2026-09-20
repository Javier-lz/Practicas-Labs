.data 
 array: .word 5, -2, 0, 7, 3, -1, 4, 8
 out_array: .word 0,0,0,0,0,0,0,0
 accumul: .word 0
 size: .word 8
.text

main: 
    lw a1, size
   
    xor a2,a2,a2
    la a0, array 
    la a4, out_array
    addi a4,a4,-4
    addi a0,a0,-4
    lw a3, accumul 

    
bucle: 
    addi a2,a2,1
    
    addi a0,a0,4
    addi a4,a4,4
    
    
    
    jal function 
    bne a1, a2, bucle 
    la t1, accumul
    sw a3, 0(t1) 
    
exit: 
    li a7, 10 
    ecall 
 
#Función con a0 puntero al elemento,a4: puntero a out a3: accumul. 
function: 
  
  lw t1, 0(a0) 
  
  ble t1, zero, zero_v 
  li t3,3 
  mul t1,t1,t3
  addi t1, t1,1 
  sw t1, 0(a4)
  add a3,a3,t1 
  
  
zero_v: 
    ret


    