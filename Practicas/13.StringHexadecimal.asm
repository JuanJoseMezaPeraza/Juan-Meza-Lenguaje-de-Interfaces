; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 13: String hexadecimal
; Descripcion: Trabaja con cadenas de datos
; representados en formato hexadecimal.


INCLUDE Irvine32.inc

.data
    ; Cadena hexadecimal que representa la palabra Hola
    hexadecimal BYTE "486F6C61", 0

    ; Variables para procesar los digitos y formar cada byte
    digito1 BYTE ?
    digito2 BYTE ?
    valor BYTE ?

.code
main PROC
    ; ESI apunta al inicio de la cadena hexadecimal
    mov esi, OFFSET hexadecimal

convertir:
    ; Leer el primer digito hexadecimal
    mov al, [esi]
    cmp al, 0
    je terminar

    ; Convertir el primer digito a su valor numerico
    call HexADigito
    mov digito1, al

    ; Avanzar al siguiente caracter
    inc esi

    ; Leer el segundo digito hexadecimal
    mov al, [esi]
    cmp al, 0
    je terminar

    ; Convertir el segundo digito a su valor numerico
    call HexADigito
    mov digito2, al

    ; Combinar ambos digitos en un byte:
    ; el primero ocupa los 4 bits superiores
    mov al, digito1
    shl al, 4
    or al, digito2

    ; Mostrar el caracter ASCII resultante
    call WriteChar

    ; Avanzar al siguiente par hexadecimal
    inc esi
    jmp convertir

terminar:
    ; Finalizar el programa
    call Crlf
    exit
main ENDP

; --------------------------------------------------
; HexADigito:
; Convierte un caracter hexadecimal en un valor de 0 a 15.
; Entrada: AL contiene '0'-'9', 'A'-'F' o 'a'-'f'.
; Salida: AL contiene el valor numerico.
; --------------------------------------------------
HexADigito PROC
    cmp al, '9'
    jbe esNumero

    ; Si es una letra, convertirla a mayuscula
    and al, 0DFh
    sub al, 'A' - 10
    ret

esNumero:
    sub al, '0'
    ret
HexADigito ENDP

END main