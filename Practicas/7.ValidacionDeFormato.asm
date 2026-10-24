; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 7: Validacion de formato
; Descripcion: Verifica que la cadena ingresada
; coincida exactamente con la clave TEC-123.

LEER UNA CADENA DE TEXTO Y COMPARARLA TEC-123 SI NO ESCRIBE EXACTAMENTE ESO MARCA ERROR Y LO PIDE DE NUEVO

INCLUDE Irvine32.inc

.data
    cadena      BYTE 50 DUP(0)
    msg_pedir   BYTE "Ingrese la clave (ejemplo TEC-123): ", 0
    msg_error   BYTE "ERROR: Formato o clave incorrecta.", 0Dh, 0Ah, 0
    msg_exito   BYTE "¡CORRECTO! La clave ingresada es valida.", 0Dh, 0Ah, 0

.code

main PROC
    call Clrscr

pedir_cadena:
    mov edx, OFFSET msg_pedir
    call WriteString

    mov edx, OFFSET cadena
    mov ecx, SIZEOF cadena
    call ReadString                ; EAX nos da la longitud

    cmp eax, 7                     ; Debe medir exactamente 7
    jne error_formato

  
    mov esi, OFFSET cadena         ; ESI apunta al primer caracter ('T')

    ; Validar 'T'
    mov ah, [esi]                  ; Lee el caracter en la posición actual de ESI
    cmp ah, 'T'
    jne error_formato

    ; Validar 'E'
    inc esi                        ; Apunta a la siguiente letra
    mov ah, [esi]
    cmp ah, 'E'
    jne error_formato

    ; Validar 'C'
    inc esi                        ; Apunta a la siguiente letra
    mov ah, [esi]
    cmp ah, 'C'
    jne error_formato

    ; Validar '-'
    inc esi                        ; Apunta al guion
    mov ah, [esi]
    cmp ah, '-'
    jne error_formato

    ; Validar '1'
    inc esi                        ; Apunta al primer numero
    mov ah, [esi]
    cmp ah, '1'
    jne error_formato

    ; Validar '2'
    inc esi                        ; Apunta al segundo numero
    mov ah, [esi]
    cmp ah, '2'
    jne error_formato

    ; Validar '3'
    inc esi                        ; Apunta al tercer numero
    mov ah, [esi]
    cmp ah, '3'
    jne error_formato

    jmp clave_correcta

error_formato:
    call Crlf
    mov edx, OFFSET msg_error
    call WriteString
    call Crlf
    jmp pedir_cadena

clave_correcta:
    call Crlf
    mov edx, OFFSET msg_exito
    call WriteString

    exit
main ENDP
END main