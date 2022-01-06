FirefoxLayout() {
  Sleep, 500
  WinMove, A, , 640, 0, 1600, 1445
}

OperaLayout() {
  WinMove, A, , 640, 50, 1600, 1340
}

;--------------------------------------------------------------------

MoveLayoutRight() {
  WinGetPos, X, , Width, , A
  Delta := A_ScreenWidth / 8
  NewX := X + Delta
  if (NewX > (A_ScreenWidth - Width)) {
    NewX := A_ScreenWidth - Width
  }
  WinMove, A, , %NewX%, , ,
}

MoveLayoutLeft() {
  WinGetPos, X, , Width, , A
  Delta := A_ScreenWidth / 8
  NewX := X - Delta
  if (NewX < 0) {
    NewX := 0
  }
  WinMove, A, , %NewX%, , ,
}

ShrinkWidthLayout() {
  WinGetPos, , , Width, , A
  Delta := A_ScreenWidth / 8
  NewWidth := Width - Delta
  if (NewWidth < Delta) {
    NewWidth := Delta
  }
  WinMove, A, , , , %NewWidth%,
}

EnlargWidthLayout() {
  WinGetPos, X, , Width, , A
  Delta := A_ScreenWidth / 8
  NewWidth := Width + Delta
  if ((X + NewWidth) > A_ScreenWidth) {
    NewWidth := A_ScreenWidth - X
  }
  WinMove, A, , , , %NewWidth%,
}


TwoThirdsLayoutRight() {
  ActWin := WinActive("A")
  WinMove, A, , A_ScreenWidth / 3, , A_ScreenWidth - (A_ScreenWidth / 3),
  Send, !{Esc}
  Sleep, 150
  WinMove, A, , 0, , A_ScreenWidth / 3,
  ; from: https://jacks-autohotkey-blog.com/2020/04/20/autohotkey-tricks-for-tracking-activating-target-process-windows/#more-41349
  WinActivate, ahk_id %ActWin%
}

HeightLayout() {
  WinMove, A, , , 50, , A_ScreenHeight-100
}

MyCenterWindow(Width, Height) {
  X := A_ScreenWidth/2-Width/2
  Y := A_ScreenHeight/2-Height/2
  WinMove, A, , X, Y, Width, Height
}

FullHdCenterLayout() {
  MyCenterWindow(1920, 1080)
}

HdCenterLayout() {
  MyCenterWindow(1280, 720)
}

SmallCenterLayout() {
  MyCenterWindow(835, 500)
}
