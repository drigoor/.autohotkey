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

MyDefaultCenterLayout()
{
    MyCenterWindow(1920, 1080)
}

MyChromeLeftLayout()
{
  WinMove, A, , -7, 0, 1294, 1447
}

MyChromeRightLayout()
{
  WinMove, A, , 1273, 0, 1294, 1447
}

MyFirefoxLeftLayout()
{
  WinMove, A, , -5, 0, 1290, 1445
}

MyFirefoxRightLayout()
{
  WinMove, A, , 1275, 0, 1290, 1445
}
