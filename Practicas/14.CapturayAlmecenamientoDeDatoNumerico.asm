; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 14: Captura y almacenamiento de
; dato numerico.
; Descripcion: Captura un numero ingresado por
; el usuario y lo almacena para usarlo despues.

CALCULO DE DESCARRGA CON ESCRITURA (PRACTICA)
INCLUDE Irvine32.inc

.data
    msg_descargados BYTE "CANTIDAD DESCARGADOS : ", 0
    msg_pendientes  BYTE "CANTIDAD PENDIENTES  : ", 0
    msg_porcentaje  BYTE "PORCENTAJE DESCARGADO: ", 0
    msg_grupos      BYTE "GRUPOS DE 1024 BYTES   : ", 0
    msg_residuo     BYTE "RESIDUO DE LOS GRUPOS  : ", 0

    Tam_Arch       = 100000
    Bloques        = 125
    Tam_Bloque     = 512

    ; Variables DWORD para almacenar los resultados de los cálculos
    bytesDescargados DWORD ?
    bytesPendientes  DWORD ?
    porcentaje       DWORD ?
    grupos1024       DWORD ?
    residuo1024      DWORD ?

    ; Buffers de 11 bytes para almacenar las cadenas convertidas (con 00h al final)
    bufDescargados   BYTE 11 DUP(0)
    bufPendientes    BYTE 11 DUP(0)
    bufPorcentaje    BYTE 11 DUP(0)
    bufGrupos        BYTE 11 DUP(0)
    bufResiduo       BYTE 11 DUP(0)

.code
main PROC
    ; 1. MULTIPLICACIÓN: Total de bytes descargados (125 * 512 = 64000)
    mov eax, Bloques
    mov ebx, Tam_Bloque
    mul ebx                 ; EAX = 64000
    mov bytesDescargados, eax

    ; 2. RESTA: Bytes pendientes (100000 - 64000 = 36000)
    mov eax, Tam_Arch
    sub eax, bytesDescargados
    mov bytesPendientes, eax

    ; 3. PORCENTAJE: (bytesDescargados * 100) / Tam_Arch
    mov eax, bytesDescargados
    mov ebx, 100
    mul ebx                 ; EAX = 6,400,000
    mov ebx, Tam_Arch
    xor edx, edx
    div ebx                 ; EAX = 64
    mov porcentaje, eax

    ; 4. DIVISIÓN PARA GRUPOS DE 1024: bytesDescargados / 1024
    mov eax, bytesDescargados
    mov ebx, 1024
    xor edx, edx
    div ebx                 ; EAX = cociente (grupos), EDX = residuo
    mov grupos1024, eax
    mov residuo1024, edx

    ; --- MOSTRAR RESULTADOS USANDO WriteString Y convertirDecimal ---

    ; A. Bytes Descargados
    mov eax, bytesDescargados
    mov esi, OFFSET bufDescargados
    call convertirDecimal
    mov edx, OFFSET msg_descargados
    call WriteString
    mov edx, OFFSET bufDescargados
    call WriteString
    call Crlf

    ; B. Bytes Pendientes
    mov eax, bytesPendientes
    mov esi, OFFSET bufPendientes
    call convertirDecimal
    mov edx, OFFSET msg_pendientes
    call WriteString
    mov edx, OFFSET bufPendientes
    call WriteString
    call Crlf

    ; C. Porcentaje
    mov eax, porcentaje
    mov esi, OFFSET bufPorcentaje
    call convertirDecimal
    mov edx, OFFSET msg_porcentaje
    call WriteString
    mov edx, OFFSET bufPorcentaje
    call WriteString
    mov al, '%'             ; Agregamos símbolo de porcentaje opcional
    call WriteChar
    call Crlf

    ; D. Grupos de 1024 Bytes
    mov eax, grupos1024
    mov esi, OFFSET bufGrupos
    call convertirDecimal
    mov edx, OFFSET msg_grupos
    call WriteString
    mov edx, OFFSET bufGrupos
    call WriteString
    call Crlf

    ; E. Residuo
    mov eax, residuo1024
    mov esi, OFFSET bufResiduo
    call convertirDecimal
    mov edx, OFFSET msg_residuo
    call WriteString
    mov edx, OFFSET bufResiduo
    call WriteString
    call Crlf

    exit
main ENDP


; ----------------------------------------------------------------
; Procedimiento convertirDecimal
; Recibe: EAX = número a convertir, ESI = dirección del buffer
; Utiliza: DIV, residuos, PUSH/POP y conversión ASCII
; ----------------------------------------------------------------
convertirDecimal PROC
    pushad              ; Guarda los registros en la pila

    mov ecx, 0          ; Inicializar contador de dígitos
    mov ebx, 10         ; Divisor decimal

    ; Manejar el caso especial si el número es 0
    cmp eax, 0
    jne conversion_loop
    mov byte ptr [esi], '0'
    mov byte ptr [esi+1], 0
    jmp fin_conv

conversion_loop:
    cmp eax, 0
    je pop_loop
    xor edx, edx
    div ebx             ; EAX = cociente, EDX = residuo (dígito actual)
    push edx            ; Guardar el dígito en la pila
    inc ecx
    jmp conversion_loop

pop_loop:
    pop edx             ; Extraer dígito de la pila (en orden correcto)
    add dl, '0'         ; Convertir valor numérico a su carácter ASCII
    mov [esi], dl       ; Guardar en el buffer
    inc esi
    loop pop_loop

    mov byte ptr [esi], 0 ; Agregar el terminador nulo (00h) requerido

fin_conv:
    popad               ; Restaurar registros
    ret
convertirDecimal ENDP

END main