.global _start
.extern main
.extern _init_signal
_start:

call _init_signal

    movl 4($esp), %eax
    movl 8(%esp), %ebx
    pushl %ebx
    pushl %eax
    
    call main
    
    addl $0x8, %esp
    
    movl %eax, %ebx
    movl $0, %eax
    
    int $0x80
    
    .wait:
    hlt
    jmp .wait
