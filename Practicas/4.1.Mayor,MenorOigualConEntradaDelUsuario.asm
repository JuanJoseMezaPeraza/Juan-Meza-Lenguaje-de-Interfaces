; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 4: Saltos
; Practica 4.1: Mayor, menor o igual con entrada
; del usuario.
; Descripcion: Compara dos numeros ingresados por
; el usuario y determina si son mayores, menores
; o iguales.


INCLUDE Irvine32.inc

.data
    mensaje1 BYTE "Ingresa el primer numero: ", 0
    mensaje2 BYTE "Ingresa el segundo numero: ", 0

    msgMayor BYTE "El primer numero es mayor.", 0
    msgMenor BYTE "El primer numero es menor.", 0
    msgIgual BYTE "Los dos numeros son iguales.", 0

    num1 DWORD ?
    num2 DWORD ?

.code
main PROC
    ; Solicitar el primer numero
    mov edx, OFFSET mensaje1
    call WriteString
    call ReadInt
    mov num1, eax

    ; Solicitar el segundo numero
    mov edx, OFFSET mensaje2
    call WriteString
    call ReadInt
    mov num2, eax

    ; Comparar los dos numeros
    mov eax, num1
    cmp eax, num2

    ; Saltar a la etiqueta correspondiente
    jg esMayor
    jl esMenor
    je sonIguales

esMayor:
    mov edx, OFFSET msgMayor
    call WriteString
    call Crlf
    jmp fin

esMenor:
    mov edx, OFFSET msgMenor
    call WriteString
    call Crlf
    jmp fin

sonIguales:
    mov edx, OFFSET msgIgual
    call WriteString
    call Crlf

fin:
    exit
main ENDP

END main
