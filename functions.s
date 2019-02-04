# USING REGISTERS:
# %rsi - input text
# %rdi - output text
# %rdx - key
# %rcx - length
# r8 - mode (1-code 2-decode)
# r9 - diff for lang
#r10 - type of current symbol

.text
.globl _caesar
_caesar:
    xor %rax,%rax
    movq $26, %r9
    cmpq $1, %r8
    je check_lang
    cmpq $2, %r8
    jne exit
    negq %rdx
    check_lang:
        cmpq $0,%rdx
        jg while_length
        negq %r9 
    while_length:
        #movb (%rsi),%al
        #addq $1,%rsi
        lodsb
        movb %al,(%rdi)
        call check_symbol
        movq %rbx,%r10
        cmpq $0,%rbx
        je eofthis
        addq %rdx,(%rdi)
    while_not_range:
        call check_symbol
        cmpq %rbx,%r10
        je eofthis
        subq %r9,(%rdi)
        jmp while_not_range
    eofthis:
        subq $1,%rcx
        addq $1,%rdi
        cmpl $0,%ecx
        jg while_length
    exit:
ret

check_symbol:
    xor %rbx,%rbx
    cmpq $0x41,(%rdi)
    jl check_big
    cmpq $0x5a,(%rdi)
    jg check_big
    movq $1,%rbx
    jmp eofchecksymbol
    check_big:
        cmpq $0x61,(%rdi)
        jl eofchecksymbol
        cmpq $0x7a,(%rdi)
        jg eofchecksymbol
        movq $2,%rbx
    eofchecksymbol:
ret




