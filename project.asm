INCLUDE Irvine32.inc

DisplayFlags PROTO

.data
titleMsg BYTE "Register and Flag Behavior Analyzer",0
lineMsg  BYTE "--------------------------------",0

msgAdd BYTE "ADD Result = ",0
msgSub BYTE "SUB Result = ",0
msgInc BYTE "INC Result = ",0
msgDec BYTE "DEC Result = ",0
msgAnd BYTE "AND Result = ",0
msgOr  BYTE "OR Result = ",0
msgXor BYTE "XOR Result = ",0
msgShl BYTE "SHL Result = ",0
msgShr BYTE "SHR Result = ",0

cfMsg BYTE " CF=",0
zfMsg BYTE " ZF=",0
sfMsg BYTE " SF=",0
ofMsg BYTE " OF=",0
pfMsg BYTE " PF=",0

.code
main PROC

    mov edx, OFFSET titleMsg
    call WriteString
    call Crlf
    mov edx, OFFSET lineMsg
    call WriteString
    call Crlf
    call Crlf

    mov eax, 7
    mov ebx, 1
    add eax, ebx
    mov edx, OFFSET msgAdd
    call WriteString
    call WriteDec
    call Crlf
    call DisplayFlags

    mov eax, 5
    mov ebx, 5
    sub eax, ebx
    mov edx, OFFSET msgSub
    call WriteString
    call WriteDec
    call Crlf
    call DisplayFlags

    mov eax, 7FFFFFFFh
    inc eax
    mov edx, OFFSET msgInc
    call WriteString
    call WriteHex
    call Crlf
    call DisplayFlags

    dec eax
    mov edx, OFFSET msgDec
    call WriteString
    call WriteHex
    call Crlf
    call DisplayFlags

    mov eax, 0Fh
    mov ebx, 0F0h
    and eax, ebx
    mov edx, OFFSET msgAnd
    call WriteString
    call WriteHex
    call Crlf
    call DisplayFlags

    mov eax, 1
    mov ebx, 2
    or eax, ebx
    mov edx, OFFSET msgOr
    call WriteString
    call WriteHex
    call Crlf
    call DisplayFlags

    xor eax, eax
    mov edx, OFFSET msgXor
    call WriteString
    call WriteDec
    call Crlf
    call DisplayFlags

    mov eax, 1
    shl eax, 1
    mov edx, OFFSET msgShl
    call WriteString
    call WriteDec
    call Crlf
    call DisplayFlags

    shr eax, 1
    mov edx, OFFSET msgShr
    call WriteString
    call WriteDec
    call Crlf
    call DisplayFlags

    exit
main ENDP

DisplayFlags PROC

    mov edx, OFFSET cfMsg
    call WriteString
    setc al
    movzx eax, al
    call WriteDec

    mov edx, OFFSET zfMsg
    call WriteString
    setz al
    movzx eax, al
    call WriteDec

    mov edx, OFFSET sfMsg
    call WriteString
    sets al
    movzx eax, al
    call WriteDec

    mov edx, OFFSET ofMsg
    call WriteString
    seto al
    movzx eax, al
    call WriteDec

    mov edx, OFFSET pfMsg
    call WriteString
    setp al
    movzx eax, al
    call WriteDec

    call Crlf
    call Crlf
    ret

DisplayFlags ENDP

END main
