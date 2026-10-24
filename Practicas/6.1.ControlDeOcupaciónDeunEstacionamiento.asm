
; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 6.1: Control de ocupacion de un
; estacionamiento.
; Descripcion: Controla los espacios ocupados
; y disponibles mediante un contador.

INCLUDE Irvine32.inc

.data
    titulo BYTE "CONTROL DE ESTACIONAMIENTO", 0
    menu BYTE 13,10,"1. Entrada de vehiculo",13,10,
              "2. Salida de vehiculo",13,10,
              "3. Consultar ocupacion",13,10,
              "0. Salir",13,10,
              "Selecciona una opcion: ",0
    msgEntrada BYTE "Vehiculo registrado. ",0
    msgSalida BYTE "Salida registrada. ",0
    msgLleno BYTE "Estacionamiento lleno.",0
    msgVacio BYTE "No hay vehiculos en el estacionamiento.",0
    msgOcupacion BYTE "Vehiculos estacionados: ",0
    msgError BYTE "Opcion no valida.",0
    msgFin BYTE "Programa terminado.",0

    ocupacion DWORD 0
    capacidad DWORD 10

.code
main PROC

    mov edx, OFFSET titulo
    call WriteString
    call Crlf

menuPrincipal:
    mov edx, OFFSET menu
    call WriteString
    call ReadInt

    cmp eax, 0
    je finalizar

    cmp eax, 1
    je entrada

    cmp eax, 2
    je salida

    cmp eax, 3
    je consultar

    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    jmp menuPrincipal

entrada:
    ; Comprueba si hay espacio disponible
    mov eax, ocupacion
    cmp eax, capacidad
    jae estacionamientoLleno

    ; Incrementa la ocupacion
    inc ocupacion

    mov edx, OFFSET msgEntrada
    call WriteString
    jmp mostrarOcupacion

estacionamientoLleno:
    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf
    jmp menuPrincipal

salida:
    ; Comprueba que haya vehiculos estacionados
    cmp ocupacion, 0
    je estacionamientoVacio

    ; Decrementa la ocupacion
    dec ocupacion

    mov edx, OFFSET msgSalida
    call WriteString
    jmp mostrarOcupacion

estacionamientoVacio:
    mov edx, OFFSET msgVacio
    call WriteString
    call Crlf
    jmp menuPrincipal

consultar:
    ; Muestra la ocupacion actual
    jmp mostrarOcupacion

mostrarOcupacion:
    call Crlf
    mov edx, OFFSET msgOcupacion
    call WriteString
    mov eax, ocupacion
    call WriteDec
    call Crlf
    jmp menuPrincipal

finalizar:
    mov edx, OFFSET msgFin
    call WriteString
    call Crlf
    exit

main ENDP
END main
