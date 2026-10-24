; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 9: Push y Pop
; Descripcion: Utiliza la pila para guardar
; temporalmente datos y recuperarlos despues.

PUSH Y POP

INCLUDE Irvine32.inc

.code
main PROC

    ; BLOQUE 1: PUSH Y POP
    mov eax,40

    push eax

    nop

    mov eax,0 
    pop ebx

    nop

    ; BLOQUE 2: ORDEN DE LIFO

    mov eax,10
    push eax

    mov eax,20
    push eax

    mov eax,30
    push eax

    mov eax,67
    push eax

    nop

     pop eax
     pop ebx
     pop ecx

    nop

    ;BLOQUE 3: CONSERVAR REGISTROS

    mov eax,100
    mov ebx,200

    pop eax
    pop ebx

    mov eax,999
    mov ebx,666

    pop ebx
    pop eax

    nop
    ;BLOQUE 4: CALL Y RET

    mov eax,50
    mov eebx,100

    call aumentarDiez

    nop


    exit
main ENDP

aumentarDiez PROC
    push ebx

    mov ebx,10
    add eax,ebx

    pop ebx

    ret
    aumentarDiez ENDP

END main