; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Descripcion: Captura un mensaje ingresado por el
; usuario y lo muestra en pantalla.

INCLUDE Irvine32.inc Ingreso de datos ReadString

.data
	mensajeBienvenida BYTE "Que quieres escribir?",0
	palabra BYTE 20 DUP(0)
.code
main PROC
	mov edx,OFFSET mensajeBienvenida
	call WriteString

	mov edx,OFFSET palabra
	mov ecx, SIZEOF palabra

	call ReadString
	call Crlf

	mov edx,OFFSET palabra
	call WriteString
	call Crlf
	exit
main ENDP

END main



INCLUDE Irvine32.inc incluye contador de caracteres

.data
	mensajeBienvenida BYTE "Que quieres escribir?",0
	palabra BYTE 20 DUP(0)
	NumChar BYTE "El numero de caracteres de tu palabra es :"
.code
main PROC
	mov edx,OFFSET mensajeBienvenida
	call WriteString

	mov edx,OFFSET palabra
	mov ecx, SIZEOF palabra

	call ReadString
	call Crlf

	mov edx,OFFSET palabra
	call WriteString
	call Crlf

	mov edx,OFFSET NumChar
	call WriteString
	call WriteDec
	exit
main ENDP

END main
