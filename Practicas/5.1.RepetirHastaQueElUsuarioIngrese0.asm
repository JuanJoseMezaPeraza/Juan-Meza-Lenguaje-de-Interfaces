; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 5.1: Repetir hasta que el usuario
; ingrese 0.
; Descripcion: Solicita numeros repetidamente
; hasta que el usuario ingresa cero.


INCLUDE Irvine32.inc

.data
    mensaje BYTE "Ingresa un numero (0 para terminar): ", 0
    resultado BYTE "Numero ingresado: ", 0
    despedida BYTE "Ingresaste 0. Fin del programa.", 0

.code
main PROC

ciclo:
    mov edx, OFFSET mensaje
    call WriteString       ; Muestra la instruccion
    call ReadInt           ; Lee un numero entero

    cmp eax, 0             ; Comprueba si el numero es cero
    je terminar            ; Si es cero, termina el ciclo

    mov ebx, eax           ; Guarda el numero ingresado
    mov edx, OFFSET resultado
    call WriteString       ; Muestra el mensaje
    mov eax, ebx
    call WriteInt          ; Muestra el numero
    call Crlf              ; Salta a la siguiente linea

    jmp ciclo              ; Repite el proceso

terminar:
    mov edx, OFFSET despedida
    call WriteString
    call Crlf

    exit
main ENDP
END main
