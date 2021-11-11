.text
__start:
.global __start
  call main
  
finish:
  li a0, 10
  ecall