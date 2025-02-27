SendAndEnter(Cmd) {
  Send Cmd "{Enter}"
}


Explorer(Dir) {
  Run Dir
  TextStr := StrSplit(Dir, "\").Pop()
  Target := TextStr " " "ahk_exe explorer.exe ahk_class CabinetWClass"
  WinWait Target
  WinActivate Target
}


ExplorerOpenOrCycle() { ; based on: https://github.com/TaranVH/2nd-keyboard (switchExplorer)
  Sleep 11 ; this is to avoid the stuck modifiers bug
  WinTitle := "ahk_class CabinetWClass"
  if not WinExist(WinTitle) {
    Run "explorer"
    WinWait WinTitle
  }
  GroupAdd "explorer_group", WinTitle
  if WinActive("ahk_exe explorer.exe") {
    GroupActivate "explorer_group", "r"
  } else {
    WinActivate WinTitle ; you have to use WinActivatebottom if you didn't create a window group.
  }
}


MyApp(WinTitle, Target, LayoutFunc := "") {
  DoLayout := false
  if not WinExist(WinTitle) {
    Run Target
    DoLayout := true
  }
  WinWait WinTitle
  WinActivate WinTitle
  if DoLayout and LayoutFunc {
    Sleep 150
    LayoutFunc.Call()
  }
}


scoop0(dir, program) {
  return "C:\bin\scoop\apps\" dir "\current\" program
}


scoop(AppAndArgs, Layout := "", WinTitle := "", AppDirName := "") {
  App := StrSplit(AppAndArgs, A_Space)[1]
  if not WinTitle {
    WinTitle := "ahk_exe " App ".exe"
  }
  if not AppDirName {
    AppDirName := App
  }
  MyApp(WinTitle, scoop0(AppDirName, AppAndArgs), Layout)
}


app(AppAndArgs, Layout := "", WinTitle := "") {
  App := StrSplit(AppAndArgs, A_Space)[1]
  if not WinTitle {
    WinTitle := "ahk_exe " App ".exe"
  }
  MyApp(WinTitle, AppAndArgs, Layout)
}


brave() {
  scoop("brave --incognito", OperaLayout, "ahk_exe brave.exe", "brave")
}


opera() {
  scoop("opera --private --user-data-dir=" scoop0("opera", "profile"), OperaLayout, "ahk_exe opera.exe", "opera")

  ; mklink /J c:\home\scoop\apps\opera\current\profile c:\home\scoop\persist\opera\profile
}


youtube(Thing) {
  brave()
  Sleep 150
  Send "{Ctrl Down}l{Ctrl Up}"
  Sleep 150
  Send "https://www.youtube.com/results?search_query=" Thing "{Enter}"
}


firefoxPrivate(Args := "", LayoutFunc := FirefoxLayout) {
  Send "^+p"
  Sleep 30
  Send "{Ctrl Down}l{Ctrl Up}"
  Sleep 30
  SendAndEnter Args
  Sleep 100
  if(LayoutFunc) {
    LayoutFunc.Call()
  }
}


FocusMode() {
  ActiveId := WinGetID("A")
  WinMinimizeAll
  WinRestore "ahk_id " ActiveId
}


ShowInfo(Info) {
  MyGui := Gui()
  MyGui.Opt "+LastFound +AlwaysOnTop -Caption +ToolWindow"
  MyGui.SetFont "s10", "Verdana"
  MyGui.MarginX := 80
  MyGui.MarginY := 20
  MyGui.Add "Text", , Info
  MyGui.Show "NoActivate"
  Sleep 1000
  MyGui.Destroy()
}


ShowTime() {
  ShowInfo FormatTime("Hmm", "Time")
}


ShowWindowInfo() {
  WinGetPos &X, &Y, &Width, &Height, "A"
  ShowInfo "x: " X " y: " Y " (" Width " x " Height ")"
}


HideShowDesktopIcons() { ; from (v1): https://www.reddit.com/r/AutoHotkey/comments/gcftm0/hide_desktop_icons/
  ; alternative: https://windowsloop.com/hide-unhide-desktop-icons-keyboard-shortcut/
  Hwnd := ControlGetHwnd("SysListView321", "ahk_class Progman")
  WinTitle := "ahk_id " Hwnd
  ControlSend "{F5}", , WinTitle

  if DllCall("IsWindowVisible", "UInt", Hwnd) {
    WinHide WinTitle
  } else {
    WinShow WinTitle
  }
}
