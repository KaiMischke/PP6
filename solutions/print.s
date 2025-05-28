.section .data
msg:    .ascii "Hello from GAS!\n"
len = . - msg

    .section .text
    .global _start
_start:
    movl $4, %eax        # syscall: sys_write
    movl $1, %ebx        # file descriptor: stdout
    movl $msg, %ecx      # pointer to message
    movl $len, %edx      # message length
    int $0x80            # make syscall

    movl $1, %eax        # syscall: sys_exit
    movl $0, %ebx        # status code
    int $0x80            # make syscall
