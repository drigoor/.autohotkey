
FocusMode() {
  WinGet, active_id, ID, A
  WinMinimizeAll
  WinRestore, ahk_id %active_id%
}

ShowTime() {
  FormatTime, TimeString, Hmm, Time
  Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
  Gui, Font, s10, Consolas
  Gui, Margin, 80, 20
  Gui, Add, Text, , %TimeString%
  Gui, Show, NoActivate
  Sleep, 900
  Gui, Destroy
}

ShowWindowInfo() {
  WinGetActiveStats, Title, Width, Height, X, Y
  Gui +LastFound +AlwaysOnTop -Caption +ToolWindow
  Gui, Font, s10, Consolas
  Gui, Margin, 80, 20
  Gui, Add, Text, , x: %X% y: %Y% (%Width% x %Height%)
  Gui, Show, NoActivate
  Sleep, 1500
  Gui, Destroy
}

ShowWindowSize() {
  WinGetActiveStats, Title, Width, Height, X, Y
  Progress, zh0 b fs9, %Width% x %Height%, , , Consolas
  Sleep, 1000
  Progress, Off
}

MyApp(WinTitle, Target, LayoutFunc := "") {
  if WinExist(WinTitle) {
    if WinActive(WinTitle) {
      WinMinimize
    }
    else {
      ; WinActivate, %WinTitle%
      ; WinGet, hWnd, ID, %WinTitle%
      ; DllCall("SetForegroundWindow", UInt, hWnd)
      Sleep, 150
      WinGet, WinId, ID, %WinTitle%
      DllCall("SwitchToThisWindow", "UInt", WinId, "UInt", 1)
    }
  }
  else {
    Run, %Target%
    WinWait, %WinTitle%
    WinActivate
    if (IsFunc(LayoutFunc)) {
      %Layoutfunc%()
    }
  }
}

; based on: https://github.com/TaranVH/2nd-keyboard (switchExplorer)
MyExplorer() {
  Sleep 11 ; this is to avoid the stuck modifiers bug
  if not WinExist("ahk_class CabinetWClass") {
    Run, explorer.exe
  }
  GroupAdd, explorer_group, ahk_class CabinetWClass
  if WinActive("ahk_exe explorer.exe") {
    GroupActivate, explorer_group, r
  }
  else {
    WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
  }
}
