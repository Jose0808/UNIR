.data
fibs: .word   0 : 12        # "array" de 12 palabras que contienen los valores
size: .word  12             # tamaño del "array" 
      .text
      la   $t0, fibs        # direccion de la matriz
      la   $t5, size        # direccion del tamaño
      lw   $t5, 0($t5)      # cargar el tamaño del array
      li   $t2, 1           # 1 es el primer numero de la serie
      add.d $f0, $f2, $f4
      sw   $t2, 0($t0)      # F[0] = 1
      sw   $t2, 4($t0)      # F[1] = F[0] = 1
      addi $t1, $t5, -2     # Contador para el bucle incremento en tamaño - 2
loop: lw   $t3, 0($t0)      # Valor del array en F[n] 
      lw   $t4, 4($t0)      # Valor del array en F[n+1]
      add  $t2, $t3, $t4    # $t2 = F[n] + F[n+1]
      sw   $t2, 8($t0)      # guarda F[n+2] = F[n] + F[n+1] en array
      addi $t0, $t0, 4      # incrementar en 4
      addi $t1, $t1, -1     # contador de bucle decremental
      bgtz $t1, loop        # repetir
      la   $a0, fibs        # primer argumento (array)
      add  $a1, $zero, $t5  # segundo argumento (tamaño)
      jal  print            # impresion
      li   $v0, 10          #Codigo de servicio para terminar la ejecucion
      syscall               
		
#########  para imprimir. 

      .data
space:.asciiz  " "          # espacio para insertar entre numeros
head: .asciiz  "Los numeros de la serie Fibonacci son:\n"
      .text
print:add  $t0, $zero, $a0  # inicial de la matriz
      add  $t1, $zero, $a1  # inicializar el contador del array
      la   $a0, head        # cargar encabezado
      li   $v0, 4           # servicio de imporimir
      syscall               # impresion
out:  lw   $a0, 0($t0)      # cargar el numero de la serie
      li   $v0, 1           # especificar que se va a imprimir
      syscall               # imprimir
      la   $a0, space       # cargar el espacio
      li   $v0, 4           # especificar que se va a imprimir
      syscall               # imprimir
      addi $t0, $t0, 4      # incremento
      addi $t1, $t1, -1     # decremento
      bgtz $t1, out         # repetir
      jr   $ra              # return