﻿'#########################################################
'#  frmAbout.bi                                         #
'#  This file is part of VisualFBEditor                  #
'#  Authors: Xusinboy Bekchanov (bxusinboy@mail.ru)      #
'#           Liu XiaLin (LiuZiQi.HK@hotmail.com)         #
'#########################################################

#include once "frmAbout.bi"

'#Region "Form"
	Constructor frmAbout

		This.Name = "frmAbout"
		This.Text = ML("About")
		This.SetBounds 0, 0, 456, 538
		This.BorderStyle = FormBorderStyle.FixedDialog
		This.MaximizeBox = False
		This.MinimizeBox = False
		This.StartPosition = FormStartPosition.CenterScreen
		#ifndef __USE_GTK__
			This.DefaultButton = @CommandButton1
			This.CancelButton = @CommandButton1
		#endif
		Label1.Name = "Label1"
		Label1.Font.Name = "Times New Roman"
		Label1.Font.Bold = True
		Label1.Font.Size = 15
		Label1.SetBounds 84, 12, 252, 24
		Label1.Parent = @This
		CommandButton1.Name = "CommandButton1"
		CommandButton1.Text = ML("&Close")
		#ifndef __USE_GTK__
			CommandButton1.Default = True
			Label1.Text = "Visual FB Editor " & pApp->Version
		#else
			Label1.Text = "Visual FB Editor " & WStr(VERSION)
		#endif
		CommandButton1.SetBounds 348, 481, 92, 26
		CommandButton1.OnClick = @CommandButton1_Click
		CommandButton1.Parent = @This
		' Label2
		Label2.Name = "Label2"
		Label2.Text = ML("Authors") & !":\r" & _
		!"Xusinboy Bekchanov\r" & _
		!"e-mail: <a href=""mailto:bxusinboy@mail.ru"">bxusinboy@mail.ru</a>\r" & _
		!"Liu XiaLin\r" & _
		!"e-mail: <a href=""mailto:liuziqi.hk@hotmail.com"">liuziqi.hk@hotmail.com</a>\r\r" & _
		!"QQ Forums 1032313876 78458582 \r\r" & _
		ML("For donation") & !":\r Patreon: <a href=""https://www.patreon.com/xusinboy"">patreon.com/xusinboy</a>,\r WebMoney: <a href=""https://www.webmoney.ru""> WMZ: Z884195021874</a>\r\r\r\r" & _
		ML("Thanks to") & !" Nastase Eodor for codes of FreeBasic Windows GUI ToolKit and Simple Designer\r" & _
		ML("Thanks to") & !" Aloberoger for codes of GUITK-S Windows GUI FB Wrapper Library\r" & _
		ML("Thanks to") & !" Laurent GRAS for codes of FBDebugger\r" & _
		ML("Thanks to") & !" José Roca for codes of Afx\r" & _
		ML("Language files by") & !":\r" & _
		!"Xusinboy Bekchanov (Russian, Uzbekcyril, Uzbeklatin)\r" & _
		!"Liu XiaLin (Chinese)\r"  & _
		!"Thomas Frank Ludewig (Deutsch)\r"
		Label2.BorderStyle = 0
		Label2.SetBounds 10, 66, 432, 403
		Label2.Parent = @This
		' lblIcon
		lblIcon.Name = "lblIcon"
		lblIcon.Text = "lblIcon"
		'lblIcon.RealSizeImage = false
		#ifdef __USE_GTK__
			If Dir(ExePath & "/Resources/VisualFBEditor.ico")<>"" Then lblIcon.Graphic.Icon.LoadFromFile(ExePath & "/Resources/VisualFBEditor.ico", 48, 48)
		#else
			lblIcon.Graphic.Icon.LoadFromResourceID(1, 48, 48)
		#endif
		lblIcon.SetBounds 18, 10, 48, 48
		lblIcon.Parent = @This
		' lblImage
		With lblImage
			.Name = "lblImage"
			.Text = "lblImage"
			.SetBounds 268, 66, 170, 170
			#ifdef __USE_GTK__
				If Dir(ExePath & "/Resources/weChat.png")<>"" Then .Graphic.Bitmap.LoadFromFile(ExePath & "/Resources/weChat.png")
			#else
				.Graphic.Bitmap = "weChat"
			#endif
			.Parent = @This
		End With
	End Constructor

	Dim Shared As frmAbout fAbout
	pfAbout = @fAbout
	#ifndef _NOT_AUTORUN_FORMS_
		frm.Show

		App.Run
	#endif
'#End Region

Private Sub frmAbout.CommandButton1_Click(ByRef Sender As Control)
	Cast(Form Ptr, Sender.Parent)->CloseForm
End Sub

Private Sub frmAbout.lblImage_Click(ByRef Sender As ImageBox)

End Sub
