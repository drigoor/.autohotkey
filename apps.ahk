notepad() {
  MyAppWithLatestLayout(A_ThisFunc)
}

mspaint() {
  MyAppWithLatestLayout(A_ThisFunc)
}

cmd(Args := "") {
  MyAppWithCenteredLayout(A_ThisFunc, Args)
}

powershell(Args := "") {
  MyAppWithCenteredLayout(A_ThisFunc, Args)
}

;--------------------------------------------------------------------

MyAppWithCenteredLayout(App, Args) {
  WinTitle = ahk_exe %App%.exe
  Target = %App% %Args%
  Layout = FullHdCenterLayout
  MyApp(WinTitle, Target, Layout)
}

MyAppWithLatestLayout(App) {
  WinTitle = ahk_exe %App%.exe
  MyApp(WinTitle, App)
}

;-----------------------------------------

scoop(dir, program) {
  return "C:\home\scoop\apps\" . dir . "\current\" . program
}

git() {
  WinTitle = ahk_class mintty
  Target = git-bash.exe --cd=C:\home
  Layout = FullHdCenterLayout
  MyApp(WinTitle, scoop(A_ThisFunc, Target), Layout)
}

emacs() {
  WinTitle = ahk_exe %A_ThisFunc%.exe
  Target = bin\runemacs.exe
  Layout = FullHdCenterLayout
  MyApp(WinTitle, scoop(A_ThisFunc, Target), Layout)
}

opera(Args := "") {
  Dir = %A_ThisFunc%
  Exe = launcher.exe
  WinTitle = ahk_exe %A_ThisFunc%.exe
  Target := scoop(Dir, Exe) " --user-data-dir=" scoop(Dir, "profile") " " Args
  MyApp(WinTitle, Target)
}

youtube(Thing) {
  Run, % scoop("opera", "launcher.exe") " --user-data-dir=" scoop("opera", "profile") " --private"
  WinWait, ahk_exe opera.exe
  Sleep, 250
  Send https://www.youtube.com/results?search_query=%Thing%{Enter}
}

firefox(Args := "") {
  Dir = %A_ThisFunc%-portable
  Exe = %A_ThisFunc%.exe
  WinTitle = ahk_exe %Exe%
  Target := scoop(Dir, Exe) " -profile " scoop(Dir, "profile") " " Args
  Layout = %A_ThisFunc%Layout
  MyApp(WinTitle, Target, Layout)
}

firefoxLayout() {
  WinMove, A, , 1275, 0, 1290, 1445 ; right  WinMove, A, , -5, 0, 1290, 1445 ; left
}

firefoxPrivateWindow(Args := "") {
  Run, % scoop("firefox-portable", "firefox.exe") " -profile " scoop("firefox-portable", "profile") " -private-window" " " Args
}

chrome(Args := "") {
  Dir = google%A_ThisFunc%-portable
  Exe = %A_ThisFunc%.exe
  WinTitle = ahk_exe %Exe%
  Target := scoop(Dir, Exe) " --user-data-dir=""" scoop(Dir, "User Data") """ " Args
  MyApp(WinTitle, Target)
}

idea() {
  Dir = %A_ThisFunc%
  Exe = %A_ThisFunc%64.exe
  WinTitle = ahk_exe %Exe%
  Target := scoop(Dir, "bin\"Exe)
  MyApp(WinTitle, Target)
}

code() {
  Dir = vs%A_ThisFunc%
  Exe = %A_ThisFunc%.exe
  WinTitle = ahk_exe %Exe%
  Target := scoop(Dir, Exe)
  MyApp(WinTitle, Target)
}
