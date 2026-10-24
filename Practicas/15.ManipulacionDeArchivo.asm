; Materia: Lenguajes de Interfaces
; Alumno: Juan Jose Meza Peraza
; Horario: 10:00 - 11:00
; Docente: JOSE LUIS MEDINA JIMENEZ
; Practica 15: Manipulacion de archivo
; Descripcion: Crea y escribe informacion en
; un archivo, y despues lo cierra correctamente.


INCLUDE Irvine32.inc

.data
    nombreArchivo BYTE "mensaje.txt", 0
    mensaje BYTE "Hola, este es un archivo creado desde MASM.", 0Dh, 0Ah
    longitudMensaje DWORD LENGTHOF mensaje

    manejador DWORD ?
    mensajeError BYTE "Error al crear o escribir el archivo.", 0
    mensajeExito BYTE "Archivo creado y escrito correctamente.", 0

.code
main PROC
    ; Crear el archivo para escritura
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile

    ; Comprobar si ocurrio un error al crear el archivo
    cmp eax, INVALID_HANDLE_VALUE
    je errorArchivo

    ; Guardar el manejador del archivo
    mov manejador, eax

    ; Escribir el mensaje dentro del archivo
    mov eax, manejador
    mov edx, OFFSET mensaje
    mov ecx, longitudMensaje
    call WriteToFile

    ; Cerrar el archivo
    mov eax, manejador
    call CloseFile

    ; Mostrar confirmacion
    mov edx, OFFSET mensajeExito
    call WriteString
    call Crlf
    exit

errorArchivo:
    ; Mostrar mensaje si no se pudo crear el archivo
    mov edx, OFFSET mensajeError
    call WriteString
    call Crlf
    exit

main ENDP
END main
