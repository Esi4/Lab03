.text
__start:
.global __start
  li a4, 0 #i = 0
  li a5, 0 #j = 0
  li a6, 0 #0
  
  lw a7, length  #длинна массива
  lw a1, result
  
  la s2, array #нулевой элемент массива
  la s3, array #нулевой элемент массива
  la t1, result#адрес резульата 
  
  
for_i:
  bgeu a4, a7, final #если i>=length, то идём в конец
  lw s0, 0(s2) #записываем в s0 элемент array[i]
for_j:
  bgeu a5, a7, total #если j>=length, то идём в конец цикла for_i
  lw s1, 0(s3) #записываем в s1 элемент array[j]	
  beq s0, s1, c2plus  #если array[i] == array[j], идём в count2++
  bge s0, s1, c1plus  #если array[i] >= array[j], идём в count1++
  blt s0, s1, c1minus #если array[i] < array[j], идём в count1--
  
c1plus: 
  addi a2, a2, 1 #увеличиваем первый счётчик на 1
  jal zero, end_forj #переход в конец цикла
c1minus: 
  addi a2, a2, -1#уменьшаем первый счётчик на 1
  jal zero, end_forj #переход в конец цикла
c2plus: 
  addi a3, a3, 1 #увеличиваем второй счётчик на 1
  jal zero, end_forj #переход в конец цикла
  
end_forj:
  addi s3, s3, 4 #переход к след. элементу массива
  addi a5, a5, 1 #увеличиваем j на 1
  jal zero, for_j #переход в for_j
total:
  beq a3, a7, pre_final #проверка на count2 == length
  beq a2, a6, pre_final #проверка на count1 == 0
  addi a6, a6, 1        #a6++
  beq a2, a6, division  #проверка на count1 == 1
  addi a6, a6, -2       #q6 -= 2
  beq a2, a6, division  #проверка на count1 == -1
  jal zero, end_fori    #идём в конец цикла
division:               # \
  srli s0, s0 1         # | деление a[i] на 2(когда массив чётный)
  add a1, a1, s0        # /
end_fori:
  addi s2, s2, 4 #переход к след. элементу массива
  addi a4, a4, 1 #увеличиваем i на 1	 
  la s3, array #обновляем цикл for_j, записав снова нулевой элемент в s3
  li a2, 0 #count1 = 0 первый счётчик
  li a3, 0 #count2 = 0 второй счётчик
  li a5, 0 #обнуляем j
  li a6, 0 #обнуляем переменную, для проверки счётчика
  jal zero, for_i #переход в for_i
pre_final: 
  add a1, a1, s0 #для чётного массива, складываем два числа(result)
final:
  sw a1, 0(t1)   #записываем в память ответ
  li a0, 10      #\
  ecall          #/ останов
 
 .data #секция изменяемых данных
result:
  .word 0


 .rodata #секция неизменяемых данных
length:
 .word 6
array:
 .word 8, 1, 2, 20, 7, 11  