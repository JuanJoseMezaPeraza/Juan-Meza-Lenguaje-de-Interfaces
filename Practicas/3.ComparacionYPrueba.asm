; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 3: Comparacion y prueba
; Descripcion: Utiliza CMP y TEST para comparar
; valores y comprobar las banderas del procesador.

INCLUDE Irvine32.inc COMPARACION DE DATOS USO DE LAS FLAGS
	
.code
main PROC
	;Caso 1: ZERO FLAG

	mov eax,5
	mov ebx,5

	cmp eax,ebx
	call DumpRegs

	mov eax,10h
	cmp eax,10h

	call DumpRegs

	
	;CASO 2: SIGN FLAG

	mov eax,0
	mov ebx,0

	mov al,-5
	mov bl,1
	
	cmp al,bl
	call DumpRegs

	;CASO 3: CARRY FLAG

	mov eax,0
	mov ebx,0

	mov al,5
	mov bl, 10

	cmp al,bl

	call DumpRegs

	;CASO 4: OVERFLOW
	mov eax,0
	mov ebx,0

	mov al,-128
	mov bl,1

	cmp al,bl

	call DumpRegs

	;CASO 5: TEST
	mov eax,0
	mov ebx,5

	test eax,1
	call DumpRegs

	exit



	
main ENDP

END main
