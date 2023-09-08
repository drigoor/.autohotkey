LayoutExpandHeight() {
  WinMove , 50, , A_ScreenHeight - 100, "A"
}


LayoutCenterWindow(Width, Height) {
  X := A_ScreenWidth/2 - Width/2
  Y := A_ScreenHeight/2 - Height/2
  WinMove X, Y, Width, Height, "A"
}


LayoutFullHd() {
  LayoutCenterWindow 1920, 1080
}


LayoutHd() {
  LayoutCenterWindow 1280, 720
}


LayoutMoveLeft() {
  WinGetPos &X, , &Width, , "A"
  Delta := A_ScreenWidth / 8
  NewX := X - Delta
  if NewX < 0 {
    WinGetClientPos &ClientX, , , , "A"
    NewX := -(ClientX - X)
  }
  WinMove NewX, , , , "A"
}


LayoutMoveRight() {
  WinGetPos &X, , &Width, , "A"
  Delta := A_ScreenWidth / 8
  NewX := X + Delta
  Max := A_ScreenWidth - Width
  if NewX > Max {
    WinGetClientPos &ClientX, , , , "A"
    NewX := Max + (ClientX - X)
  }
  WinMove NewX, , , , "A"
}


LayoutMoveUp() {
  WinGetPos , &Y, , &Height, "A"
  Delta := A_ScreenHeight / 8
  NewY := Y - Delta
  Max := A_ScreenHeight - Height
  if NewY < 0 {
    NewY := 0
  }
  WinMove , NewY, , , "A"
}


LayoutMoveDown() {
  WinGetPos , &Y, , &Height, "A"
  Delta := A_ScreenHeight / 8
  NewY := Y + Delta
  Max := A_ScreenHeight - Height
  if NewY > Max {
    WinGetClientPos , , , &ClientHeight, "A"
    NewY := Max + (Height - ClientHeight)
  }
  WinMove , NewY, , , "A"
}


LayoutShrinkWidth() {
  WinGetPos , , &Width, , "A"
  Delta := A_ScreenWidth / 8
  NewWidth := Width - Delta
  if NewWidth < Delta {
    NewWidth := Delta
  }
  WinMove , , NewWidth, , "A"
}


LayoutEnlargeWidth() {
  WinGetPos &X, , &Width, , "A"
  Delta := A_ScreenWidth / 8
  NewWidth := Width + Delta
  if (X + NewWidth) > A_ScreenWidth {
    NewWidth := A_ScreenWidth - X
  }
  WinMove , , NewWidth, , "A"
}


FirefoxLayout() {
  Sleep 500
  WinMove 640, 0, 1600, 1445, "A"
}


OperaLayout() {
  WinMove 640, 50, 1600, 1340, "A"
}
