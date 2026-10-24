; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 8: Operaciones aritmeticas
; Descripcion: Realiza operaciones matematicas
; utilizando instrucciones del ensamblador.

INSTRUCCIONES ARITMETICAS 
INCLUDE Irvine32.inc

.code
main PROC

    ; 1.- ADD Y SUB OPERACION DE SUMA Y RESTA
    mov eax,50
    mov ebx,20

    add eax,ebx
    sub eax,15

    nop

    ;2.- CF: ACARREO EN SUMA SIN SIGNO

    mov eax,0
    mov al,255

    add al,1

    nop

    ;3.- OF:DESBORDAMIENTO EN UNA SUMA CON SIGNO

    mov eax,0
    mov al ,127

    add al,1

    nop

    ;4.- MUL : PRODUCTO DENTRO DE 32 BITS

    mov eax,25
    mov ebx,3

    mul ebx

    nop

    ;5.- MUL : PRODUCTO FUERA DE 32 BITS

    mov eax,65537
    mov ebx,65537

    mul ebx

    nop

    ;6.- IMUL : PRODUCTO CON SIGNO

    mov eax,-5
    

    imul eax,eax,3

    nop

    ;7.- DIV : DIVIDIENDO VALORES PEQUEÑOS SIN SIGNO

    mov eax,125
    mov edx,0
    mov ebx,12

    div ebx

    nop

    ;8.- IDIV Y CDQ: DIVIDIENDO VALORES  CON SIGNO

    mov eax,-125
    cdq
    mov ebx,12

    idiv ebx

    nop



    exit
main ENDP
END main