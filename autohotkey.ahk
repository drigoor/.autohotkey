; #  Windows Key  #
; ^  Control Key  ^
; !  Alt Key      !
; +  Shift Key    +


#SingleInstance
#NoTrayIcon


SetCapsLockState "AlwaysOff"
; SetNumLockState "AlwaysOn"
SetScrollLockState "AlwaysOff"


; CapsLock::LWin

CapsLock & i::Up
CapsLock & k::Down
CapsLock & j::Left
CapsLock & l::Right


#Include %A_ScriptDir%\utils.ahk


#HotIf WinActive("ahk_exe WindowsTerminal.exe")
#e::SendAndEnter "explorer ."
^l::SendAndEnter "cls"
^d::SendAndEnter "exit"


#HotIf WinActive("ahk_exe mintty.exe")
#e::SendAndEnter "explorer ."


#HotIf WinActive("Program Manager")
#i::Run scoop0("autohotkey", "WindowSpy.ahk")


#HotIf WinACtive("ahk_exe brave.exe")
space::{
  if InStr(WinGetTitle("A"), "youtube")
    Send "k"
  else
    Send " "
}


#HotIf
^!r::Reload ; Ctrl+Alt+R


#1::Explorer "C:\home"
#+1::Explorer "\\wsl.localhost\Ubuntu\home\user"
#2::Explorer "C:\Users\User\Downloads"
#4::Explorer "C:\home\aulas\FP\2324"
#5::Explorer "C:\home\aulas\AED\2324"
#6::Explorer "C:\home\aulas\TFC\2324"

#e::ExplorerOpenOrCycle
#+e::Run "explorer"

^|::Run A_WinDir "\system32\taskmgr.exe"

#Include %A_ScriptDir%\layouts.ahk

#f5::LayoutFullHd
#f6::LayoutHd
#!j::LayoutMoveLeft
#!l::LayoutMoveRight
#!i::LayoutMoveUp
#!k::LayoutMoveDown
#^i::LayoutExpandHeight
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
#9::scoop "firefox https://www.ulusofona.pt https://moodle.ensinolusofona.pt/course/view.php?id=17627 http://email.ulusofona.pt/" ;; , FirefoxLayout ;; 23/24 FP https://www.ulusofona.pt https://moodle.ensinolusofona.pt/course/view.php?id=23380
#+9::firefoxPrivate ; this only works if a previous firefox window exists
#+g::scoop "gitextensions" ; lets keep Win+G for the Windows Game Bar (to record small videos)
#j::scoop "IDE\bin\idea64.exe", , "ahk_exe idea64.exe", "idea"

#b::app "msedge"
#m::youtube "game of thrones soundtrack" ; synthwave 80
#n::app "notepad"
#+n::Run "notepad"

#o::scoop "obsidian"
#!o::Run "obsidian://open?vault=apontamentos"
#+o::Run "obsidian://open?vault=apontamentos_aulas"
#^p::app "mspaint"
#!p::scoop "sumatrapdf"
#v::scoop "code", , , "vscode"
#+v::scoop "vscodium"

#+Enter::MyApp "C:\WINDOWS\system32\cmd.exe", "C:\WINDOWS\system32\cmd.exe /K cd /D C:\home", LayoutFullHd
#!Enter::MyApp "Windows PowerShell", "wt -w _quake -d C:\home" ;; after open, shortcut Win + \ will focus on powershell
#Enter::scoop "git-bash --cd=C:\home", LayoutFullHd, "ahk_class mintty", "git"
#+!Enter::scoop "mingw64", LayoutFullHd, "ahk_class mintty", "msys2"

#d::FocusMode
#h::Showtime
#i::ShowWindowInfo

!f12::HideShowDesktopIcons

; Volume
Alt & WheelUp::SoundSetVolume "+1" ; Volume_Down
Alt & WheelDown::SoundSetVolume "-1" ; Volume_Down
Alt & MButton::SoundSetVolume "10"
Control & MButton::SoundSetVolume "0"

^PgUp::SoundSetVolume "+1"
^PgDn::SoundSetVolume "-1"

^+PgUp::SoundSetVolume "+10"
^+PgDn::SoundSetVolume "-10"

#NumpadAdd::SoundSetVolume "+1"
#NumpadSub::SoundSetVolume "-1"

; Transparency
#!t::WinSetTransparent 200, "A"
#!+t::WinSetTransparent "Off", "A"

; Hide/Show Taskbar
#t::WinHide "ahk_class Shell_TrayWnd"
#+t::WinShow "ahk_class Shell_TrayWnd"




; THING TO EXPLORE
;
; ::btw::by the way


; THINGS TO CLEAN
;
; #0::scoop("chrome", , , "googlechrome")
; chrome(Args := "") {
;   Dir = google%A_ThisFunc%-portable
;   Exe = %A_ThisFunc%.exe
;   WinTitle = ahk_exe %Exe%
;   Target := scoop0(Dir, Exe) " --user-data-dir=""" scoop0(Dir, "User Data") """ " Args
;   MyApp(WinTitle, Target)
; }
; #+d::app("C:\Program Files\Docker\Docker\Docker Desktop.exe", "", "ahk_exe Docker Desktop.exe")
; #NumpadEnter::Run calc.exe


; TwoThirdsLayoutRight() {
;   ActWin := WinActive("A")
;   WinMove, A, , A_ScreenWidth / 3, , A_ScreenWidth - (A_ScreenWidth / 3),
;   Send, !{Esc}
;   Sleep, 150
;   WinMove, A, , 0, , A_ScreenWidth / 3,
;   ; from: https://jacks-autohotkey-blog.com/2020/04/20/autohotkey-tricks-for-tracking-activating-target-process-windows/#more-41349
;   WinActivate, ahk_id %ActWin%
; }

; #Include %A_ScriptDir%\AltWindowDrag.ahk


;; avoid language bar stuff
#Space::MsgBox 'windows + space'
