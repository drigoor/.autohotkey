app(AppAndArgs, Layout := "", WinTitle := "") {
  App := StrSplit(AppAndArgs, A_Space)[1]
  if (!WinTitle) {
    WinTitle = ahk_exe %App%.exe
  }
  MyApp(WinTitle, AppAndArgs, Layout)
}

scoop(AppAndArgs, Layout := "", WinTitle := "", AppDirName := "") {
  App := StrSplit(AppAndArgs, A_Space)[1]
  if (!WinTitle) {
    WinTitle = ahk_exe %App%.exe
  }
  if (!AppDirName) {
    AppDirName = %App%
  }
  MyApp(WinTitle, scoop0(AppDirName, AppAndArgs), Layout)
}

scoop0(dir, program) {
  return "C:\home\scoop\apps\" . dir . "\current\" . program
}

;--------------------------------------------------------------------

opera() {
  scoop("launcher --private --user-data-dir=" scoop0("opera", "profile"), "OperaLayout", "ahk_exe opera.exe", "opera")

  ; mklink /J c:\home\scoop\apps\opera\current\profile c:\home\scoop\persist\opera\profile

}
youtube(Thing) {
  opera()
  Sleep, 500
  Send {Ctrl Down}l{Ctrl Up}
  Sleep, 150
  Send https://www.youtube.com/results?search_query=%Thing%{Enter}
}

firefoxPrivateWindow(Args := "", LayoutFunc := "") {
  Send ^+p
  Sleep, 500
  Send {Ctrl Down}l{Ctrl Up}
  Sleep, 150
  Send %Args%{Enter}
  Sleep, 150
  if (IsFunc(LayoutFunc)) {
    %Layoutfunc%()
  }
}

chrome(Args := "") {
  Dir = google%A_ThisFunc%-portable
  Exe = %A_ThisFunc%.exe
  WinTitle = ahk_exe %Exe%
  Target := scoop0(Dir, Exe) " --user-data-dir=""" scoop0(Dir, "User Data") """ " Args
  MyApp(WinTitle, Target)
}
