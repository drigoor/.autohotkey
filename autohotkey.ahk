; #  Windows Key  #
; ^  Control Key  ^
; !  Alt Key      !
; +  Shift Key    +

; http://www.daviddeley.com/autohotkey/xprxmp/autohotkey_expression_examples.htm

#SingleInstance force
; #NoTrayIcon

SetCapsLockState AlwaysOff
SetNumLockState AlwaysOn
SetScrollLockState AlwaysOff

#Include %A_ScriptDir%\apps.ahk
#Include %A_ScriptDir%\utils.ahk
#Include %A_ScriptDir%\layouts.ahk

; if in cmd
#IfWinActive ahk_exe cmd.exe
^c::Send {Ctrl Down}c{Ctrl Up}y{Enter}
^d::Send exit{Enter}
^l::Send cls{Enter}
#e::Send explorer .{Enter}

; if in powershell
#IfWinActive ahk_exe powershell.exe
^d::Send exit{Enter}
#e::Send explorer .{Enter}

; if in gitbash
#IfWinActive ahk_exe mintty.exe
#e::Send explorer .{Enter}

; if in desktop
#IfWinActive Program Manager
#i::Run % scoop0("autohotkey", "WindowSpy.ahk")

; if in other window
#IfWinActive
^|::Run %windir%\system32\taskmgr.exe /7 ; hack because of ducky 65% keyboard
^!r::Reload
#f1::Send #^{Left}
#f2::Send #^{Right}
#i::ShowWindowInfo()
#h::ShowTime()
#c::Run %A_Startup% ; check for more: https://www.autohotkey.com/docs/Variables.htm

#f5::FullHdCenterLayout()
#f6::HdCenterLayout()
#f7::SmallCenterLayout()

#left::MoveLayoutLeft()
#right::MoveLayoutRight()
#+left::ShrinkWidthLayout()
#+right::EnlargWidthLayout()
#+up::HeightLayout()
#!^3::TwoThirdsLayoutRight()

#1::Run C:\home
#2::Run C:\Users\User\Downloads
#3::scoop("bin\runemacs", , "ahk_exe emacs.exe", "emacs")
#+3::Run runemacs
; #+3::Run runemacs -q ;  -l C:\home\projects\emacs\nano-emacs\nano.el
#4::Run C:\home\aulas\2122\
#5::Run C:\home\aulas\2122\FP\
#6::Run C:\home\aulas\2122\TFC\
#8::opera()
#9::scoop("firefox https://www.ulusofona.pt", "FirefoxLayout")
#+9::firefoxPrivateWindow("https://www.gmail.com", "FirefoxLayout") ; this only works if a previous window exists
#0::scoop("chrome", , , "googlechrome")

#b::app("msedge")
#+d::app("C:\Program Files\Docker\Docker\Docker Desktop.exe", "", "ahk_exe Docker Desktop.exe")
#e::MyExplorer()
#+e::Run explorer.exe
#+g::scoop("gitextensions") ; lets keep Win+G for the Windows Game Bar (to record small videos)
#j::scoop("IDE\bin\idea64", "", "ahk_exe idea64.exe", "idea")
#m::youtube("game of thrones soundtrack") ; synthwave 80
#n::app("notepad")
#+n::Run notepad
#o::scoop("obsidian")
#!o::Run "obsidian://open?vault=apontamentos"
#+o::Run "obsidian://open?vault=apontamentos_aulas"
#p::app("mspaint")
#!p::scoop("sumatrapdf")
#v::scoop("vscodium")

#+Enter::app("cmd /K cd /D C:\home", "FullHdCenterLayout")
#!Enter::app("powershell -noexit -command cd C:\home", "FullHdCenterLayout")
#Enter::scoop("git-bash --cd=C:\home", "FullHdCenterLayout", "ahk_class mintty", "git")
#+!Enter::scoop("mingw64", "FullHdCenterLayout", "ahk_class mintty", "msys2")

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


#d::FocusMode()
