; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: Jose Luis Medina Jimenez
; Practica: Ciclo Hola Mundo
; Descripcion: Imprime "Hola, Mundo!" 10 veces

INCLUDE Irvine32.inc

.data
    mensaje BYTE "Hola, Mundo!", 0

.code
main PROC
    mov ecx, 10        ; Establece 10 repeticiones

ciclo:
    mov edx, OFFSET mensaje
    call WriteString   ; Muestra el mensaje en consola
    call Crlf          ; Salta a la siguiente linea
    loop ciclo         ; Repite mientras ECX no sea cero

    exit
main ENDP

END main