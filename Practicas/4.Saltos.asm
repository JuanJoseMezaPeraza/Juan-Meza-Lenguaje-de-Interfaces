; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 4: Saltos
; Descripcion: Utiliza instrucciones de salto para
; modificar el flujo de ejecucion del programa.

SALTO INCONDICIONAL
INCLUDE Irvine32.inc
	
.code
main PROC
	mov eax,5

	jmp Continuar

	mov eax,10

Continuar:
	call DumpRegs

	exit

main ENDP

END main

COMPARACION Y SALTO CON IGUALDAD
INCLUDE Irvine32.inc
.data
	msgIguales BYTE "Los valores son iguales",0
	msgDiferentes BYTE "Los valores son diferentes",0
.code
main PROC
	mov eax,10
	mov ebx,10

	cmp eax,ebx ; se enciende Zf=1

	je iguales

	mov edx, OFFSET msgDiferentes
	call WriteString

	jmp fin

iguales:
	mov edx,OFFSET msgIguales
	call WriteString

fin:
	call Crlf
	exit

main ENDP

END main


PRACTICA MAYOR,IGUAL,MENOR

INCLUDE Irvine32.inc

.data
	mensaje1   BYTE "Teclea el primer numero : ",0
	Num1       SDWORD ?
	mensaje2   BYTE "Teclea el segundo numero : ",0
	Num2       SDWORD ?
	msgIguales BYTE "Los valores son iguales",0
	msgMayor   BYTE "El valor 1 es mayor",0
	msgMenor   BYTE "El valor 1 es menor",0

.code
main PROC

	mov edx, OFFSET mensaje1
	call WriteString
	call ReadInt
	mov Num1, eax
	call Crlf

	mov edx, OFFSET mensaje2
	call WriteString
	call ReadInt
	mov Num2, eax
	call Crlf

	mov eax, Num1
	cmp eax, Num2

	je iguales
	jg mayor
	jl menor

iguales:
	mov edx, OFFSET msgIguales
	call WriteString
	jmp fin

mayor:
	mov edx, OFFSET msgMayor
	call WriteString
	jmp fin

menor:
	mov edx, OFFSET msgMenor
	call WriteString

fin:
	call Crlf
	exit

main ENDP
END main