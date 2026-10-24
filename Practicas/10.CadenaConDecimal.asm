; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 10: Cadena con decimal
; Descripcion: Captura y almacena una cadena
; que representa un numero decimal.


INCLUDE Irvine32.inc

.data
    mensaje BYTE "Ingresa un numero decimal: ", 0
    numero BYTE 50 DUP(0)
    resultado BYTE "El numero ingresado es: ", 0

.code
main PROC
    ; Mostrar mensaje para solicitar el dato
    mov edx, OFFSET mensaje
    call WriteString

    ; Leer la cadena introducida por el usuario
    mov edx, OFFSET numero
    mov ecx, SIZEOF numero
    call ReadString

    ; Mostrar el texto que se capturo
    mov edx, OFFSET resultado
    call WriteString

    mov edx, OFFSET numero
    call WriteString
    call Crlf

    ; Finalizar el programa
    exit
main ENDP

END main
