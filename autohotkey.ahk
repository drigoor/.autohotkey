#SingleInstance force
; #NoTrayIcon

#Include apps.ahk
#Include utils.ahk
#Include layouts.ahk

; #  Windows Key  #
; ^  Control Key  ^
; !  Alt Key      !
; +  Shift Key    +

^!r::Reload

!1::Send, #^{Left}
!2::Send, #^{Right}

#c::Run %A_Startup% ; check for more: https://www.autohotkey.com/docs/Variables.htm

#1::Run C:\home
#2::Run C:\Users\User\Downloads
#5::Run C:\home\aulas\2021\LP2
; #6::Run C:\home\aulas\2021\TFC
#6::Run C:\home\quicklisp\local-projects\tfx
#7::Run C:\home\aulas\2021\AED

#f5::MyCenterWindow(1920, 1080)
#f6::MyCenterWindow(1280, 720)
#f7::MyCenterWindow(780, 474)

#e::MyExplorer()
#+e::Run, explorer.exe
#n::MyApp("Untitled - Notepad", "Notepad")
#+n::MyApp("ahk_class Notepad", "Notepad")
#p::MyApp("ahk_exe mspaint.exe", "mspaint.exe")

#!Enter::powershell()
#Enter::git()

#+Enter::MyApp2("cmd", "MyDefaultCenterLayout")
; #!Enter::MyApp2("powershell", "MyDefaultcenterlayout")
; #Enter::MyApp2("git", "MyDefaultCenterLayout")
#3::MyApp2("emacs", "MyDefaultCenterLayout")
#!e::MyRun("emacs")
; #!+e::run c:\home\bin\emacs\bin\runemacs.exe -q -l C:\home\projects_old\_external\nano-emacs\nano.el

#j::MyApp2("intellij")
#v::MyApp2("vscode")

#8::MyApp2("opera")
#!8::MyApp("opera", "MyChromeLeftLayout")
#9::MyApp2("firefox")
#!9::MyApp2("firefox", "MyFirefoxRightLayout")
#0::MyApp2("chrome")
#!0::MyApp2("chrome", "MyChromeLeftLayout")

#m::MyMusic("synthware 80s")

;--------------------------------------------------------------------

; Transparency
#!t::
WinGet, WinId, ID, A
WinSet, Transparent, 200, ahk_id %WinId%
return

#!+t::
WinGet, WinId, ID, A
WinSet, TransColor, Off, ahk_id %WinId%
return

; Hide taskbar
; from: https://www.autohotkey.com/boards/viewtopic.php?style=17&t=82538&p=360192
#t::WinHide ahk_class Shell_TrayWnd
#+t::WinShow ahk_class Shell_TrayWnd

; Hide window titlebar (if window is maximizes, this turns it fullscreen)
; from: http://superuser.com/questions/38687/windows-program-to-remove-titlebar-frame-etc-from-a-window
#f::WinSet, Style, -0xC40000, A ; using an auto-hide taskbar
#+f::WinSet, Style, +0xC40000, A ; using an auto-hide taskbar

; if in desktop
#IfWinActive Program Manager

#i::Run, C:\home\scoop\apps\autohotkey\current\WindowSpy.ahk

; if in windows explorer
#IfWinActive ahk_class CabinetWClass

; if in other window
#IfWinActive

#h::ShowTime()
#i::ShowWindowInfo()
