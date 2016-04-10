import XMonad
import qualified XMonad.StackSet as W
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeysP, additionalKeys)
import XMonad.Layout.Circle
import XMonad.Layout.Grid
import XMonad.Layout.Spiral
import XMonad.Layout.Magnifier
import XMonad.Layout.IndependentScreens

myLayout = avoidStruts $ (tiled ||| Mirror tiled ||| noBorders Full)
  where
    tiled = smartBorders (Tall nmaster delta ratio)
    nmaster = 1
    ratio = 1/2
    delta = 3/100
    ffull = noBorders Full

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myKeys = [ ("M-c", spawn "chromium")
         , ("M-x", spawn "slock")
         , ("M-e", spawn "emacs")
         , ("M-p", spawn "dmenu_run -fn 'Ubuntu Mono-32' -l 16")
         , ("M-v", spawn "vlc")
         ]
 
myConfig = defaultConfig {
  manageHook = manageDocks <+> manageHook defaultConfig
  , modMask = mod4Mask
  , borderWidth = 1
  , normalBorderColor = "#839496"
  , focusedBorderColor = "#d33682"
  , layoutHook = myLayout
  , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
  , terminal = "urxvt"
  } `additionalKeysP` myKeys

myPP = xmobarPP {
  ppCurrent = xmobarColor "black" "" . wrap "[" "]"
  , ppUrgent = xmobarColor "white" "red" . wrap "!" "!"
  , ppOrder = \(ws:l:t:_) -> [ws,l]
}

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{XMonad.modMask = mod4Mask} = (mod4Mask, xK_b )
