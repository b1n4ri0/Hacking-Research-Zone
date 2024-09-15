section .data
texto:
	db 'Bienvenidos a Reverse ESP la mejor comunidad de low level', 0
section .text
	global _start
_start:
	push byte '@' ;push del caracter con el que censuramos
	push dword texto ;push de la direccion de la cadena
	call censurar ;llamamos a la funcion
	add esp, 8 ;limpiamos los 2 parametros del stack
	mov eax, 1 ;sys_exit
	xor ebx, ebx ;codigo de salida 0
	int 0x80 ;llamada al sistema para salir
censurar:
	push ebp
	mov ebp, esp
	mov edi, [ebp+8]
	mov edx, edi
	xor eax, eax
	or ecx, 0xFFFFFFFF
	repne scasb
	add ecx, 2
	neg ecx
	mov al, [ebp+0xC]
	mov edi, edx
	rep stosb
	mov eax, edx
	mov esp, ebp
	pop ebp
	ret
