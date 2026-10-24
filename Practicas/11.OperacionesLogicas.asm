; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 11: Operaciones logicas
; Descripcion: Realiza operaciones logicas
; a nivel de bits utilizando instrucciones
; como AND, OR, XOR y NOT.

OPERACIONES LOGICAS 
INCLUDE Irvine32.inc
.data
msg_Al_Encendida BYTE "La alarma esta encendida",0
msg_Al_Apagada BYTE "La alarma esta apagada",0
;ESATDOS DE COMPUTADORA
;0 -- COMPUTADIORA ENCENDIDA 0:No 1:Si
;1 -- ALARMA                 0:No 1:Si
;2 -- COMPUTADORA ESTA CONECTADA
; CONDICIONES INICIALES : 0000 0101
.code
main PROC
;1 -- AND : Evaluacion de alarma
	mov eax,0
	mov al,00000111b
	and al,00000111b

   call WriteBin

;2 -- OR: Encender Alarma

	mov eax,0
	mov al,00000101b
	or al,00000010b

	call WriteBin

;3 -- XOR: Apagar y Encender Computadora
;ESTADO INICIAL : 0000 0101

	mov eax,0
	mov al ,00000101b
	xor al,00000001
	call WriteBin

;4 -- TEST : Evaluar alarma encendida y apagada
;realizar salto y mostrar de : "Alarma esat encendida"
;o "Alarma esta apagada"

Apagada:
	mov edx, OFFSET msg_Al_Apagada
    call WriteString
	jmp Fin

Encendiada:
	mov edx, OFFSET msg_Al_Encendida
    call WriteString
	jmp Fin
	
Fin:
   exit

   main ENDP
END main