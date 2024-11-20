section .data
s: db "section .data%cs: db %c%c%c%c%c%c%c%s%c, 0%csection .text%cglobal _start%cprintf:%cmov r12, rdi%clea r13, [rsp+8]%c.next_char:%cxor rax, rax%cmov al, byte [r12]%ctest al, al%cjz .done%cinc r12%ccmp al, 37%cjne .print_char%cmov al, byte [r12]%cinc r12%ccmp al, 115%cje .print_fstring%ccmp al, 99%cje .print_fchar%cjmp .next_char%c.print_char:%cpush rax%cmov rax, 1%cmov rdi, 1%cmov rsi, rsp%cmov rdx, 1%csyscall%cpop rax%cjmp .next_char%c.print_fstring:%cmov rdi, [r13]%ccall strlen%cmov rdx, rax%cmov rsi, rdi%cmov rax, 1%cmov rdi, 1%csyscall%cadd r13, 8%cjmp .next_char%c.print_fchar:%ccmp byte [r13], 0%cjz .skip_zero%cmov rax, 1%cmov rdi, 1%cmov rsi, r13%cmov rdx, 1%csyscall%c.skip_zero:%cinc r13%cjmp .next_char%c.done:%cret%cstrlen:%cmov rax, rdi%c.nextchr:%ccmp byte [rax], 0%cjz .done%cinc rax%cjmp .nextchr%c.done:%csub rax, rdi%cret%c_start:%clea rdi, [s]%cmov rax, 0x000A0A0A0A0A0A0A%cpush rax%cmov rax, 0x0A0A0A0A0A0A0A0A%cpush rax%cpush rax%cpush rax%cpush rax%cpush rax%cpush rax%cpush rax%cpush rax%cpush rax%cmov rax, 0x0A0A0A0A0A0A0A22%cpush rax%cpush s%cmov rax, 0x000000000000220A%cpush rax%ccall printf%cmov rax, 60%cxor rdi, rdi%csyscall%c", 0
section .text
global _start
printf:
mov r12, rdi
lea r13, [rsp+8]
.next_char:
xor rax, rax
mov al, byte [r12]
test al, al
jz .done
inc r12
cmp al, 37
jne .print_char
mov al, byte [r12]
inc r12
cmp al, 115
je .print_fstring
cmp al, 99
je .print_fchar
jmp .next_char
.print_char:
push rax
mov rax, 1
mov rdi, 1
mov rsi, rsp
mov rdx, 1
syscall
pop rax
jmp .next_char
.print_fstring:
mov rdi, [r13]
call strlen
mov rdx, rax
mov rsi, rdi
mov rax, 1
mov rdi, 1
syscall
add r13, 8
jmp .next_char
.print_fchar:
cmp byte [r13], 0
jz .skip_zero
mov rax, 1
mov rdi, 1
mov rsi, r13
mov rdx, 1
syscall
.skip_zero:
inc r13
jmp .next_char
.done:
ret
strlen:
mov rax, rdi
.nextchr:
cmp byte [rax], 0
jz .done
inc rax
jmp .nextchr
.done:
sub rax, rdi
ret
_start:
lea rdi, [s]
mov rax, 0x000A0A0A0A0A0A0A
push rax
mov rax, 0x0A0A0A0A0A0A0A0A
push rax
push rax
push rax
push rax
push rax
push rax
push rax
push rax
push rax
mov rax, 0x0A0A0A0A0A0A0A22
push rax
push s
mov rax, 0x000000000000220A
push rax
call printf
mov rax, 60
xor rdi, rdi
syscall
