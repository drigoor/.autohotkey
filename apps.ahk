
scoop(dir, program) {
    return "C:\home\scoop\apps\"dir . "\current\" . program
}

;--------------------------------------------------------------------

cmd() {
    return ["ahk_class ConsoleWindowClass", "cmd /K cd /D C:\home"]
}

powershell() {
    WinTitle = ahk_class ConsoleWindowClass
    Target = powershell.exe -noexit -command cd C:\home
    LayoutFn = MyDefaultCenterLayout
    MyApp(WinTitle, Target, LayoutFn)
    ; return ["ahk_class ConsoleWindowClass", "powershell.exe -noexit -command cd C:\home"]
}

; git() {
;     ; WinTitle = ahk_class mintty
;     ; App = git-bash.exe --cd=C:\home

;     MsgBox here
;     ; return [WinTitle, scoop(A_ThisFunc, App)]
; coisa = ahk_class mintty
;     return [coisa, scoop(A_ThisFunc, "git-bash.exe --cd=C:\home")]
; }

git() {
    WinTitle = ahk_class mintty
    Target = git-bash.exe --cd=C:\home
    LayoutFn = MyDefaultCenterLayout
    MyApp(WinTitle, scoop(A_ThisFunc, Target), LayoutFn)
}

emacs() {
    WinTitle = ahk_class Emacs
    App = bin\runemacs.exe

    return [WinTitle, scoop(A_ThisFunc, App)]
}

opera() {
    return ["ahk_class Chrome_WidgetWin_1 ahk_exe opera.exe", "C:\home\scoop\apps\opera\current\launcher --private --user-data-dir=C:\home\scoop\apps\opera\current\profile\data"]
}

firefox() {
    return ["ahk_class MozillaWindowClass", "C:\home\scoop\apps\firefox-portable\current\firefox.exe -profile C:\home\scoop\apps\firefox-portable\current\profile"]
}

chrome() {
    return ["ahk_class Chrome_WidgetWin_1 ahk_exe chrome.exe", "C:\home\scoop\apps\googlechrome-portable\current\chrome.exe --user-data-dir=""C:\home\scoop\apps\googlechrome-portable\current\User Data"""]
}

intellij() {
    return ["ahk_exe idea64.exe", "C:\home\scoop\apps\idea\current\bin\idea64.exe"]
}

vscode() {
    return ["ahk_exe Code.exe", "C:\home\scoop\apps\vscode\current\Code.exe"]
}
