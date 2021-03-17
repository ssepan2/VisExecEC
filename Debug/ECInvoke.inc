CmpMsk(%Arg1, %Arg2) MACRO
    Push %Arg1
    And %Arg1, %Arg2
    Cmp %Arg1, %Arg2
    Pop %Arg1
ENDM

StartErrorHandler(%Arg1) MACRO
	push rcx
	push rdx
	push r8
	push r9
	push r10
	push r11
	invoke AddVectoredExceptionHandler, 1, Addr ECErrorHandle
	Mov [ECdqHandler], rax
	Mov rax, %Arg1
	Mov [Error.regRip], rax
	pop r11
	pop r10
	pop r9
	pop r8
	pop rdx
	pop rcx
ENDM

EndErrorHandler MACRO
	push rcx
	push rdx
	push r8
	push r9
	push r10
	push r11
	invoke RemoveVectoredExceptionHandler, [ECdqHandler]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rdx
	pop rcx
ENDM

ECCOInvoke(%pInterface,%Method,%0,%1,%2,%3,%4,%5,%6,%7,%8,%9) MACRO
	mov rcx, [%pInterface]
	mov rax, [rcx]
	#IF ARGCOUNT = 2
		invoke [rax + %Method], [%pInterface]
	#ELSEIF ARGCOUNT = 3
		invoke [rax + %Method], [%pInterface], %0
	#ELSEIF ARGCOUNT = 4
		invoke [rax + %Method], [%pInterface], %0, %1
	#ELSEIF ArgCount = 5
		invoke [rax + %Method], [%pInterface], %0, %1, %2
	#ELSEIF ArgCount = 6
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3
	#ELSEIF ArgCount = 7
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3, %4
	#ELSEIF ArgCount = 8
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3, %4, %5
	#ELSEIF ArgCount = 9
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3, %4, %5, %6
	#ELSEIF ArgCount = 10
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3, %4, %5, %6, %7
	#ELSEIF ArgCount = 11
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3, %4, %5, %6, %7, %8
	#ELSEIF ArgCount = 12
		invoke [rax + %Method], [%pInterface], %0, %1, %2, %3, %4, %5, %6, %7, %8, %9
	#ENDIF
ENDM

#define CMPMSK CmpMsk
#define cmpmsk CmpMsk

#define ECCOINVOKE ECCOInvoke
#define eccoinvoke ECCOInvoke
