; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 12: Desplazamiento y rotacion
; Descripcion: Desplaza y rota los bits de
; un valor mediante instrucciones del procesador.

DESPLAZAMIENTO Y ROTACIONES DE BITS
INCLUDE Irvine32.inc


.code
main PROC

	mov eax,0
	mov ebx,0
	mov ecx,0
	mov edx,0
	
; 1 -- SHL : Desplazar un bit hacia la hizquierda
	mov al,10000110b
	shl al,2
	call DumpRegs
	call WriteBin

; 2 -- SHR : Desplazar un bit hacia la derecha

	mov al,00001101b
	shr al,1
	call DumpRegs
	call WriteBin

; 3 -- SAR : Desplazamiento con signo

	mov eax,0
	mov al,-8
	sar al,1

	call DumpRegs
	call WriteBin

; 4 -- SAR : Desplazamiento con valor impar

	mov eax,0
	mov al,-9
	sar al,1

	call DumpRegs
	call WriteBin

; 5 -- CONTEO CONSTANTE : Desplazar dos posiciones

	mov al,00001100b
	shl al,2

	call DumpRegs
	call WriteBin


; 6 -- CONTEO CON CL : Desplazar utilizando registro

	mov al,00001100b
	sar cl,2

	shr al,cl

	call DumpRegs
	call WriteBin


; 7 -- ROR, ROL, RCR, RCL 

	

   exit

   main ENDP
END main