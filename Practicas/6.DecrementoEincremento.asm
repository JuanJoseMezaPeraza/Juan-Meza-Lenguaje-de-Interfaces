; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica 6: Decremento e incremento
; Descripcion: Utiliza INC y DEC para aumentar
; o disminuir el valor de un contador.

CONTROL DE ACCESO DEC(DECREMENTO)
INCLUDE Irvine32.inc

.data
msgPIN BYTE "INGRESE EL PIN DE ACCESO: ",0
msgERROR BYTE "PIN INCORRECTO: ",0
msgACCESO BYTE "PIN CORRECTO ",0
msgINTENTOS BYTE "INTENTOS RESTANTES :",0
msgBLOQUEO BYTE "SISTEMA BLOQUEADO POR 9861762587 AÑOS: ",0

PinCorrecto = 6767
.code
main PROC

	mov ebx,3 ; Numero de intentos

ciclo:
	mov edx ,OFFSET msgPIN
	call WriteString
	call ReadInt
	

	cmp eax,PinCorrecto

	je acceso

	mov edx ,OFFSET msgERROR
	call WriteString
	

	dec ebx
	jz bloqueado

	mov edx ,OFFSET msgINTENTOS
	call WriteString
	

	mov eax,ebx
	call WriteDec
	call Crlf

	jmp ciclo

acceso:
	mov edx ,OFFSET msgACCESO
	call WriteString
	call Crlf
	jmp fin

bloqueado:
	mov edx ,OFFSET msgBLOQUEO
	call WriteString
	call Crlf
	jmp fin
fin:
	exit
	
main ENDP
END main

PRACTICA INC y DEC (CONTAR CUANTOS CARROS ENTRAN Y CUANTOS SALEN)

INCLUDE Irvine32.inc

.data
    MAX EQU 5                  ; Capacidad máxima
    autos SDWORD 0             ; Contador de autos

    ; Mensajes
    msg_estado  BYTE "Autos: ", 0
    msg_max     BYTE "/", 0
    msg_menu    BYTE " | 1:Entra  2:Sale  3:Salir -> ", 0
    msg_entra   BYTE "-> Carro ingresado con exito.", 0Dh, 0Ah, 0
    msg_sale    BYTE "-> Carro salio con exito.", 0Dh, 0Ah, 0
    msg_lleno   BYTE "ESTACIONAMIENTO LLENO. Cerrando...", 0Dh, 0Ah, 0
    msg_vacio   BYTE "Error: No hay autos para sacar.", 0Dh, 0Ah, 0
    msg_pausa   BYTE "Presiona cualquier tecla para continuar...", 0Dh, 0Ah, 0

.code
main PROC
    call Clrscr

inicio:
    ; 1. Mostrar estado actual
    mov edx, OFFSET msg_estado
    call WriteString
    mov eax, autos
    call WriteDec

    mov edx, OFFSET msg_max
    call WriteString
    mov eax, MAX
    call WriteDec

    mov edx, OFFSET msg_menu
    call WriteString

    ; 2. Leer opción
    call ReadInt

    ; 3. Evaluar opción
    cmp eax, 1
    je  entra_auto

    cmp eax, 2
    je  sale_auto

    cmp eax, 3
    je  fin

    jmp inicio

entra_auto:
    inc autos                  ; autos++

    ; Verificar si ya se llenó
    mov eax, autos
    cmp eax, MAX
    jge esta_lleno             ; Si llega al máximo, termina el programa

    ; Mostrar confirmación de entrada
    call Crlf
    mov edx, OFFSET msg_entra
    call WriteString
 
    ; Pausa para que alcances a ver el mensaje antes de borrar
    mov edx, OFFSET msg_pausa
    call WriteString
    call ReadChar

    call Clrscr
    jmp inicio

sale_auto:
    ; Validar que no restemos si está en 0
    cmp autos, 0
    jle esta_vacio

    dec autos                  ; autos--

    ; Mostrar confirmación de salida
    call Crlf
    mov edx, OFFSET msg_sale
    call WriteString

    ; Pausa antes de limpiar pantalla
    mov edx, OFFSET msg_pausa
    call WriteString
    call ReadChar

    call Clrscr
    jmp inicio

esta_vacio:
    call Crlf
    mov edx, OFFSET msg_vacio
    call WriteString
 
    mov edx, OFFSET msg_pausa
    call WriteString
    call ReadChar

    call Clrscr
    jmp inicio

esta_lleno:
    call Crlf
    mov edx, OFFSET msg_lleno
    call WriteString
    jmp fin

fin:
    exit
main ENDP
END main