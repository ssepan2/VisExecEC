.Const

.Data

.Code

VisExecECProcedure Frame hWnd, uMsg, wParam, lParam
	Cmp Q[uMsg], WM_CREATE
	Jne >
	Invoke OnVisExecECCreate
L2:	Ret

:	Cmp Q[uMsg], ECM_AFTERCREATE
	jne >
	;===============================
	; Just after the window has been
	; created but before it is shown
	;===============================
	Jmp < L2

:	Cmp Q[uMsg], WM_COMMAND
	Jne >
	Mov Eax, D[wParam]
	Mov Rdx, Rax
	Shr Eax, 16
	And Edx, 0000FFFFH
	Invoke OnVisExecECCommand, [hWnd], Rdx, Rax, [lParam]
	Jmp < L2

:	Cmp Q[uMsg], WM_NOTIFY
	Jne >
	Invoke OnVisExecECNotify, [hWnd], [lParam]
	Jmp < L2

:	Cmp Q[uMsg], WM_CLOSE
	Jne >
	Invoke OnVisExecECClose, [hWnd], [uMsg], [wParam], [lParam]
	Jmp << L2

:	Cmp Q[uMsg], WM_DESTROY
	Jne >
	;===========
	; Final code
	;===========
:	Xor Rax, Rax	;Return (FALSE)
	Jmp << L2
EndF
;VisExecECProcedure Proc hWnd:HWND, uMsg:ULONG, wParam:WPARAM, lParam:LPARAM
;	.If uMsg == WM_CREATE
;		;====================
;		; Initialization code
;		;====================
;	.ElseIf uMsg == ECM_AFTERCREATE
;		;===============================
;		; Just after the window has been
;		; created but before it is shown
;		;===============================
;	.ElseIf uMsg == WM_COMMAND
;		Mov Edx, wParam
;		Movzx Eax, Dx
;		Shr Edx, 16
;		Invoke OnVisExecECCommand, hWnd, Eax, Edx, lParam
;@@:		Ret
;	.ElseIf uMsg == WM_NOTIFY
;		Invoke OnVisExecECNotify, hWnd, lParam
;		Jmp @B
;	.ElseIf uMsg == WM_CLOSE
;		Invoke IsModal, hWnd
;		.If Eax
;			Invoke EndModal, hWnd, IDCANCEL
;			Mov Eax, TRUE	;Return TRUE
;			Jmp @B
;		.EndIf
;	.ElseIf uMsg == WM_DESTROY
;		;===========
;		; Final code
;		;===========
;	.EndIf
;	Xor Eax, Eax	;Return FALSE
;	Jmp @B
;VisExecECProcedure EndP

;OnVisExecECCommand Proc Private hWndParent:HWND, uCtlID:ULONG, uCode:ULONG, hWndChild:HWND
;	;============================================================
;	; Code for WM_COMMAND messages (child controls notifications)
;	;============================================================
;	Xor Eax, Eax	;Return FALSE
;	Ret
;OnVisExecECCommand EndP
;
;OnVisExecECNotify Proc Private hWndParent:HWND, lpNMHDR:LPLONG
;	;===========================================================
;	; Code for WM_NOTIFY messages (child controls notifications)
;	;===========================================================
;	Xor Eax, Eax	;Return FALSE
;	Ret
;OnVisExecECNotify EndP


OnVisExecECCreate: UseData VisExecECProcedure
	;====================
	; Initialization code
	;====================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndU

OnVisExecECCommand Frame hWndParent, uCtlID, uCode, hWndChild
	;============================================================
	; Code for WM_COMMAND messages (child controls notifications)
	;============================================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

OnVisExecECNotify Frame hWndParent, lpNMHDR
	;===========================================================
	; Code for WM_NOTIFY messages (child controls notifications)
	;===========================================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

OnVisExecECClose Frame hWnd, uMsg, wParam, lParam
	Invoke IsModal, [hWnd]
	Or Rax, Rax	 	;Cmp Rax, FALSE
	Jz >
	Invoke EndModal, [hWnd], IDCANCEL
	Mov Rax, TRUE	;Return (TRUE)
:	Ret
	Xor Rax, Rax	;Return (FALSE)
	Jmp <
EndF


VisExecEClblSomeString Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecEClblSomeInteger Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECtxtSomeInteger Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECchkSomeBoolean Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecEClblSomeDate Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECdtmSomeDate Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECgrpToolbar Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECbtnFileNew Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECgrpStatus Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECprgProgress Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECpicDirty Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecECpicAction Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecEClblStatus Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF

VisExecEClblError Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF


