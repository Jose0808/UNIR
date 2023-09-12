.text  
main:

li $s0, 12             #le asigna un valor a $s0
li $s1, 1             #le asigna un valor a $s1
li $s2, 10             #le asigna un valor a $s2
li $s3, 0             #le asigna un valor a $s3

addi $s3,$s1, 0            #le asigna a $s3 el valor de $s1
IF:                        #crea una etiqueta
bgt $s0,$s1,END            #valida si $s0 es mayor que $s1 si no va a "END"
addi $s3,$s0, 0            #le asigna a $s3 el valor de $s0 que es el mayor en este caso
END:                       #crea la etiqueta END
IF1:                       #crea la etiqueta IF1
bgt $s2,$s3,END1           #valida si $s2 es mayor que $s3 que es el mayor de los otros numeros si no va a "END"
addi $s3,$s2, 0            #le asigna a $s3 el valor de $s2 que es el mayor en este caso
END1:                      #crea la etiqueta END1

li $v0, 1                  #
addi $a0, $s3,0            # Imprime 
syscall                    #

#-------------------------Finalizar el programa----------------------------------

li $v0, 10                  #Codigo de servicio para terminar la ejecucion
syscall

	