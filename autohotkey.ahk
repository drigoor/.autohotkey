; #  Windows Key  #
; ^  Control Key  ^
; !  Alt Key      !
; +  Shift Key    +


#SingleInstance
#NoTrayIcon


SetCapsLockState "AlwaysOff"
SetNumLockState "AlwaysOn"
SetScrollLockState "AlwaysOff"


CapsLock::LWin

CapsLock & i::Up
CapsLock & k::Down
CapsLock & j::Left
CapsLock & l::Right


SetWorkingDir "D:\" ; work around for powershell to start in the right dir


#Include %A_ScriptDir%\utils.ahk


#HotIf WinActive("ahk_exe cmd.exe")
#e::SendAndEnter "explorer ."
^l::SendAndEnter "cls"
^d::SendAndEnter "exit"


#HotIf WinActive("ahk_exe powershell.exe")
#e::SendAndEnter "explorer ."
^l::SendAndEnter "cls"
^d::SendAndEnter "exit"


#HotIf WinActive("ahk_exe mintty.exe")
#e::SendAndEnter "explorer ."


#HotIf WinActive("Program Manager")
#i::Run scoop0("autohotkey", "WindowSpy.ahk")


#HotIf WinActive("ahk_exe firefox.exe")
#p::{
  Send "^t"
  Sleep 200
  Send "about:profiles{Enter}"
}


#HotIf
^!r::Reload ; Ctrl+Alt+R


#1::Explorer "d:\"
#+1::Explorer "\\wsl.localhost\Ubuntu\home\user"
#2::Explorer "C:\Users\User\Downloads"
#4::Explorer "d:\aulas\FP\2425"
#5::Explorer "d:\aulas\AED\2425"
#6::Explorer "d:\aulas\TFC\2425"

#e::ExplorerOpenOrCycle
#+e::Run "explorer"

^|::Run A_WinDir "\system32\taskmgr.exe"

#Include %A_ScriptDir%\layouts.ahk

#f5::LayoutFullHd
#f6::LayoutHd
#!j::LayoutMoveLeft
#!left::LayoutMoveLeft
#!l::LayoutMoveRight
#!right::LayoutMoveRight
#!i::LayoutMoveUp
#!k::LayoutMoveDown
#^i::LayoutExpandHeight
#^up::LayoutExpandHeight
#+j::LayoutShrinkWidth
#+l::LayoutEnlargeWidth

#3::scoop "bin\runemacs", , "ahk_exe emacs.exe", "emacs"
#+3::Run "runemacs" ; -q ;  -l C:\home\projects\emacs\nano-emacs\nano.el
#+!3::{ ;; emacs in mingw64
  scoop "mingw64", LayoutFullHd, "ahk_class mintty", "msys2"
  Sleep 100
  SendAndEnter "emacs &"
  Sleep 500
  SendAndEnter "exit"
}
#7::brave
#8::opera
#9::scoop "firefox https://www.ulusofona.pt https://mail.google.com"
#+9::firefoxPrivate ; this only works if a previous firefox window exists
#+g::scoop "gitextensions" ; lets keep Win+G for the Windows Game Bar (to record small videos)
#j::scoop "IDE\bin\idea64.exe", , "ahk_exe idea64.exe", "idea"
#u::scoop "IDE\bin\idea64.exe", , "ahk_exe idea64.exe", "idea-ultimate"
#k::scoop "IDE\bin\goland64.exe", , "ahk_exe goland64.exe", "goland"

#m::youtube "oblivion soundtrack" ; "game of thrones soundtrack" ; synthwave 80
#n::app "notepad"
#+n::Run "notepad"

#o::scoop "obsidian"
#!o::Run "obsidian://open?vault=apontamentos"
#+o::Run "obsidian://open?vault=apontamentos_aulas"
#^p::scoop "paintdotnet.exe", , "ahk_exe paintdotnet.exe", "paint.net"
#!p::scoop "sumatrapdf"
#+v::scoop "vscodium"

#+Enter::MyApp "cmd.exe", "cmd.exe /K cd /D D:\", LayoutFullHd
#!Enter::MyApp "ahk_exe powershell.exe", "powershell.exe", LayoutFullHd
#Enter::scoop "git-bash --cd=D:\", LayoutFullHd, "ahk_class mintty", "git"
#+!Enter::MyApp "ahk_exe mintty.exe", "C:\bin\msys64\mingw64.exe", LayoutFullHd

#d::FocusMode
#h::Showtime
#i::ShowWindowInfo

^f12::HideShowDesktopIcons

; Volume
^PgUp::SoundSetVolume "+1"
^PgDn::SoundSetVolume "-1"
Alt & WheelUp::SoundSetVolume "+1"
Alt & WheelDown::SoundSetVolume "-1"
Alt & MButton::SoundSetVolume "10"
Control & MButton::SoundSetVolume "0"

; Transparency
#!t::WinSetTransparent 200, "A"
#!+t::WinSetTransparent "Off", "A"

; Hide/Show Taskbar
#t::WinHide "ahk_class Shell_TrayWnd"
#+t::WinShow "ahk_class Shell_TrayWnd"

;; avoid language bar stuff
#Space::MsgBox 'windows + space'


;;; things to explore

; show battery status like the time or window information


;;; abandonware

; #b::app "msedge"
; #^p::app "mspaint"
; #v::scoop "code", , , "vscode"
; #Include %A_ScriptDir%\AltWindowDrag.ahk
; MsgBox  A_ScreenWidth " x " A_ScreenHeight " - dpi: " A_ScreenDPI
; #!Enter::MyApp "Windows PowerShell", "wt -w _quake -d D:\" ;; after open, shortcut Win + \ will focus on windows terminal
; #^Enter::MyApp "Windows PowerShell", "wt -w _quake -p Ubuntu" ;; after open, shortcut Win + \ will focus on windows terminal
; #HotIf WinACtive("ahk_exe brave.exe")
; space::{
;   if InStr(WinGetTitle("A"), "youtube")
;     Send "k"
;   else
;     Send " "
; }
