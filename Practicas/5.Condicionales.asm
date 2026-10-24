; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 5: Condicionales
; Descripcion: Evalua condiciones para ejecutar
; diferentes instrucciones segun el resultado.

CICLOS CONDICIONAL INICIO (WHILE)
INCLUDE Irvine32.inc
	
.code
main PROC
	mov ebx,1  ; Valor inicial para el ciclo while
ciclo:
	cmp ebx,100 ; Condicion de salida para el ciclo while

	jg fin ; Salto a la etiqueta fin una vez se cumpla la condicion de  salida

	mov eax,ebx
	call WriteDec ; Se imprime el valor actual de ebx en la consola
	call Crlf ; Salto de linea

	inc ebx ; Realiza un incremento de +1 en el registro señalado (ebx)

	jmp ciclo


fin:
	exit
main ENDP
END main

CICLO CONDICIONAL FINAL (DO WHILE)

INCLUDE Irvine32.inc
	
.code
main PROC
	mov ebx,1  ; Valor inicial para el ciclo while
ciclo:
	mov eax,ebx
	call WriteDec
	call Crlf
	
	inc ebx
	cmp ebx,100

	jle ciclo

	exit
main ENDP
END main

PRACTICA LEER NUMEROS POR CONSOLA
INCLUDE Irvine32.inc

.data
	Mensaje1 BYTE "TECLEA EL NUMERO 0 : ", 0
	Mensaje2 BYTE "ERROR TECLEA EL NUMERO 0 : ", 0
	Num      SDWORD ?

.code
main PROC
	; Primera lectura
	mov edx, OFFSET Mensaje1
	call WriteString
	call ReadInt
	mov Num, eax
	call Crlf

	cmp eax, 0
	jne ciclo

	exit

ciclo:
	mov edx, OFFSET Mensaje2
	call WriteString
	call ReadInt
	mov Num, eax
	call Crlf

	cmp eax, 0
	jne ciclo   

	exit         
main ENDP
END main