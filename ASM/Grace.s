; commentary outside
%define START start:
%define MSG "; commentary outside%3$c%%define START start:%3$c%%define MSG %4$c%1$s%4$c%3$c%%define MAIN _main:%3$csection .data%3$c%2$cmsg db MSG, 0%3$c%2$cfile db %4$cGrace_kid.s%4$c%3$csection .text%3$c%2$cglobal _main%3$c%2$cglobal start%3$c%2$cextern _dprintf%3$cSTART%3$cMAIN%3$c%2$cmov rax,0x2000005%3$c%2$clea rdi,[rel file]%3$c%2$cmov rsi,512+1024+2%3$c%2$cmov rdx,0644o%3$c%2$csyscall%3$c%3$c%2$cpush rax%3$c%2$cmov rdi,rax%3$c%2$clea rsi,[rel msg]%3$c%2$clea rdx,[rel msg]%3$c%2$cmov r8,10%3$c%2$cmov r9,34%3$c%2$cmov rcx,9%3$c%2$ccall _dprintf%3$c%3$c%2$cmov rax,0x2000006%3$c%2$cpop rdi%3$c%2$csyscall%3$c%3$c%2$cmov rax,0%3$c%2$cret%3$c"
%define MAIN _main:
section .data
	msg db MSG, 0
	file db "Grace_kid.s"
section .text
	global _main
	global start
	extern _dprintf
START
MAIN
	mov rax,0x2000005
	lea rdi,[rel file]
	mov rsi,512+1024+2
	mov rdx,0644o
	syscall

	push rax
	mov rdi,rax
	lea rsi,[rel msg]
	lea rdx,[rel msg]
	mov r8,10
	mov r9,34
	mov rcx,9
	call _dprintf

	mov rax,0x2000006
	pop rdi
	syscall

	mov rax,0
	ret
