.text
__start:
.global __start
 la t2, result
 la t3, array
 lw t4, length
 
 addi sp, sp, -16
 sw ra, 12(sp)
 
 call Medians
 
 lw ra, 12(sp)
 addi sp, sp, -16
 
 li a0, 0
 ret

 .data #секция изменяемых данных
result:
  .word 0


  .rodata #секция неизменяемых данных
length:
 .word 6
array:
 .word 8, 1, 2, 20, 7, 11   