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


#Include %A_ScriptDir%\utils.ahk


#HotIf WinActive("ahk_exe WindowsTerminal.exe")
#e::SendAndEnter "explorer ."
^l::SendAndEnter "cls"
^d::SendAndEnter "exit"


#HotIf WinActive("ahk_exe mintty.exe")
#e::SendAndEnter "explorer ."


#HotIf WinActive("Program Manager")
#i::Run scoop0("autohotkey", "WindowSpy.ahk")


#HotIf
^!r::Reload ; Ctrl+Alt+R

#1::Explorer "C:\home"
#2::Explorer "C:\Users\User\Downloads"
#4::Explorer "C:\home\aulas\2223"
#5::Explorer "C:\home\aulas\2223\FP"
#6::Explorer "C:\home\aulas\2223\TFC"

#e::ExplorerOpenOrCycle
#+e::Run "explorer"

^|::Run A_WinDir "\system32\taskmgr.exe"

#Include %A_ScriptDir%\layouts.ahk

#f5::LayoutFullHd
#f6::LayoutHd
#!j::LayoutMoveLeft
#!l::LayoutMoveRight
#!i::LayoutExpandHeight
#!+j::LayoutShrinkWidth
#!+l::LayoutEnlargeWidth

#3::scoop "bin\runemacs", , "ahk_exe emacs.exe", "emacs"
#+3::Run "runemacs" ; -q ;  -l C:\home\projects\emacs\nano-emacs\nano.el
#7::brave
#8::opera
#9::scoop "firefox https://www.ulusofona.pt", FirefoxLayout
#+9::firefoxPrivateWindow ; this only works if a previous firefox window exists
#+g::scoop "gitextensions" ; lets keep Win+G for the Windows Game Bar (to record small videos)
#j::scoop "IDE\bin\idea64", "", "ahk_exe idea64.exe", "idea"

#b::app "msedge"
#m::youtube "game of thrones soundtrack" ; synthwave 80
#n::app "notepad"
#+n::Run "notepad"

#o::scoop "obsidian"
#!o::Run "obsidian://open?vault=apontamentos"
#+o::Run "obsidian://open?vault=apontamentos_aulas"
#^p::app "mspaint"
#!p::scoop "sumatrapdf"
#v::scoop "vscodium"

#+Enter::MyApp "C:\WINDOWS\system32\cmd.exe", "C:\WINDOWS\system32\cmd.exe /K cd /D C:\home", LayoutFullHd
#!Enter::MyApp "Windows PowerShell", "wt -d C:\home", LayoutFullHd
#Enter::scoop "git-bash --cd=C:\home", LayoutFullHd, "ahk_class mintty", "git"

#d::FocusMode
#h::Showtime
#i::ShowWindowInfo

!f12::HideShowDesktopIcons



; THING TO EXPLORE
;
; ::btw::by the way


; THINGS TO CLEAN
;
; #+!Enter::scoop("mingw64", LayoutFullHd, "ahk_class mintty", "msys2")
; #0::scoop("chrome", , , "googlechrome")
; chrome(Args := "") {
;   Dir = google%A_ThisFunc%-portable
;   Exe = %A_ThisFunc%.exe
;   WinTitle = ahk_exe %Exe%
;   Target := scoop0(Dir, Exe) " --user-data-dir=""" scoop0(Dir, "User Data") """ " Args
;   MyApp(WinTitle, Target)
; }
; #+d::app("C:\Program Files\Docker\Docker\Docker Desktop.exe", "", "ahk_exe Docker Desktop.exe")
; #+n::
; {
;     if WinExist("Untitled - Notepad")
;         WinActivate
;     else
;         Run "Notepad"
; }

; #NumpadEnter::Run calc.exe

; #NumpadSub::SoundSet, -1
; #NumpadAdd::SoundSet, +1

; ^PgDn::SoundSet, -1
; ^PgUp::SoundSet, +1

; ^+PgDn::SoundSet, -10
; ^+PgUp::SoundSet, +10

; ; Transparency
; #!t::
; WinGet, WinId, ID, A
; WinSet, Transparent, 200, ahk_id %WinId%
; return

; #!+t::
; WinGet, WinId, ID, A
; WinSet, TransColor, Off, ahk_id %WinId%
; return

; ; Hide taskbar
; ; from: https://www.autohotkey.com/boards/viewtopic.php?style=17&t=82538&p=360192
; #t::WinHide ahk_class Shell_TrayWnd
; #+t::WinShow ahk_class Shell_TrayWnd

; ; Hide window titlebar (if window is maximizes, this turns it fullscreen)
; ; from: http://superuser.com/questions/38687/windows-program-to-remove-titlebar-frame-etc-from-a-window
; #f::WinSet, Style, -0xC40000, A ; using an auto-hide taskbar
; #+f::WinSet, Style, +0xC40000, A ; using an auto-hide taskbar

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
