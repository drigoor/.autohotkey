RightLayout()
{
  WinGetPos, X, Y, Width, Height, A
  WinMove, A, , X + (Width / 2) -10, , Width / 2 +10,
}

LeftLayout()
{
  WinGetPos, , , Width, , A
  WinMove, A, , , , Width / 2,
}

HeightLayout()
{
  WinMove, A, , , 100, , A_ScreenHeight-200
}

FullHdCenterLayout()
{
  MyCenterWindow(1920, 1080)
}

HdCenterLayout()
{
  MyCenterWindow(1280, 720)
}

SmallCenterLayout()
{
  MyCenterWindow(835, 500)
}

MyChromeLeftLayout()
{
  WinMove, A, , -7, 0, 1294, 1447
}

MyChromeRightLayout()
{
  WinMove, A, , 1273, 0, 1294, 1447
}

;--------------------------------------------------------------------

MyCenterWindow(Width, Height)
{
  X := A_ScreenWidth/2-Width/2
  Y := A_ScreenHeight/2-Height/2

  WinMove, A, , X, Y, Width, Height
}

MyCenterLeftLayout()
{
  WinGetPos,,, Width, Height, A
  WinMove, A,, (A_ScreenWidth/2)-(Width/2), (A_ScreenHeight/2)-(Height/2)
}
