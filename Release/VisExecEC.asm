.Const

.Data

hwndToolTips	DQ	NULL

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
	Invoke GetWindowItem, [hWndParent], IDC_VISEXECEC_TOOLBAR1
	Mov Rbx, Rax
	Cmp Rbx, [hWndChild]	;Is lParam the tool bar handle?
	Jne >> L4

;RETURN
L2:	Mov Rax, TRUE
	Ret

L4:	;Process menu commands
	Cmp Q[uCtlID], IDM_VISEXECEC_MNUFILENEW
	Jne >
	;NEW
	;
	;Invoke ?
	Jmp << L2

:	Cmp Q[uCtlID], IDM_VISEXECEC_MNUFILEOPEN
	Jne >
	;OPEN
	;
	;Invoke ?
	Jmp << L2


:	Cmp Q[uCtlID], IDM_VISEXECEC_MNUFILEEXIT
	Jne >
	;OPEN
	Invoke SendMessage, [hWndParent], WM_CLOSE, 0, 0
	Jmp << L2

:
	Jmp << L2


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



VisExecECToolBar1 Frame hWnd, uMsg, wParam, lParam
	;==================================
	;Write your code here or delete the
	;whole procedure if it's not needed
	;==================================
	Xor Rax, Rax	;Return (FALSE)
	Ret
EndF
