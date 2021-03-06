%ifndef GFXUTILS_GFXCLS
%define GFXUTILS_GFXCLS

;Clear screen in graphics mode
gfxcls:
	pushf
	push ax
	push cx
	push di
	push es
	mov ax, 0xA000		;Make es point video memory
	mov es, ax			;
	mov cx, 32000		;We will write 32000 times (word each time)
	mov di, 0			;Start at the beginning of the vmem
	mov ax, 0			;Fill it with 0s
	cld					;Clear direction flag
	rep stosw			;Kinda memset
	pop es
	pop di
	pop cx
	pop ax
	popf
	ret

%endif
