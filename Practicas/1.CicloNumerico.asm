; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Descripcion: Utiliza ciclos para repetir instrucciones
; un numero determinado de veces.

INCLUDE Irvine32.inc ciclo numerico

.data

.code
main PROC
	mov ecx,5
ciclo:
	mov eax,ecx
	call WriteDec ; imprimir el valor de eax en consola
	call Crlf   ; realiza el cambio de linea
	loop ciclo
	exit
main ENDP

END main