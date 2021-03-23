; #  Windows Key  #
; ^  Control Key  ^
; !  Alt Key      !
; +  Shift Key    +

#SingleInstance force
; #NoTrayIcon

#Include apps.ahk
#Include utils.ahk
#Include layouts.ahk

; if in desktop
#IfWinActive Program Manager
#i:: Run, % scoop("autohotkey", "WindowSpy.ahk")

; if in cmd
#IfWinActive ahk_exe cmd.exe
^d::Send, exit{Enter}
^c::Send, {Ctrl Down}c{Ctrl Up}y{Enter}

; if in powershell
#IfWinActive ahk_exe powershell.exe
^d::Send, exit{Enter}

; if in gitbash
#IfWinActive ahk_exe mintty.exe
#e::Send, explorer .{Enter}

; if in other window
#IfWinActive
#h::ShowTime()
#i::ShowWindowInfo()

^!r::Reload

#f1::Send, #^{Left}
#f2::Send, #^{Right}

#c::Run %A_Startup% ; check for more: https://www.autohotkey.com/docs/Variables.htm

^|::Run, %windir%\system32\taskmgr.exe /7

#1::Run C:\home
#2::Run C:\Users\User\Downloads
#3::emacs()
#+3::Run runemacs ; -q -l C:\home\projects_old\_external\nano-emacs\nano.el
#5::Run C:\home\aulas\2021\AED
#6::Run C:\home\aulas\2021\TFC
#7::Run C:\home\quicklisp\local-projects\tfx
#8::opera("--private")
#9::firefox("https://www.ulusofona.pt")
#+9::firefoxPrivateWindow("https://www.gmail.com") ; this only works if a previous window exists
#0::chrome()

#f5::FullHdCenterLayout()
#f6::HdCenterLayout()
#f7::SmallCenterLayout()

#up::HeightLayout()
#left::LeftLayout()
#right::RightLayout()

#e::MyExplorer()
#+e::Run, explorer.exe

#n::notepad()
#+n::Run notepad
#p::mspaint()

#+Enter::cmd("/K cd /D C:\home")
#!Enter::powershell("-noexit -command cd C:\home")
#Enter::git()

#j::idea()
#v::code()
#d::docker()

#ç::compass()
#º::Run C:\home\quicklisp\local-projects\tfx\mongodb.bat
#~::Run C:\home\quicklisp\local-projects\plages\mongodb.bat

#m::youtube("synthwave")

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
