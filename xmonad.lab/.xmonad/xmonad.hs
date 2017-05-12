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
import XMonad.Layout.Spacing

myLayout = avoidStruts $ ((smartSpacing 5 $ tiled) ||| (smartSpacing 5 $ Mirror tiled) ||| noBorders Full)
  where
    tiled = smartBorders (Tall nmaster delta ratio)
    nmaster = 1
    ratio = 1/2
    delta = 3/100
    ffull = noBorders Full

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

myBar = "xmobar"

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys = [ ("M-c", spawn "c")
         , ("M-y", spawn "c $(xclip -selection primary -out)")
         , ("M-e", spawn "raise-or-launch emacs 'emacs -a \'\' -c'")
         , ("M-x", spawn "slock")
         , ("M-p", spawn "dmenu_run -fn 'Ubuntu Mono-32' -l 16")
         , ("M-v", spawn "vlc")
         ] ++
         [ (otherModMasks ++ "M-" ++ [key], action tag)
           | (tag, key) <- zip myWorkspaces "123456789"
           , (otherModMasks, action) <- [ ("", windows . W.view)
                                           , ("S-", windows . W.shift)]
           ]
 
myConfig = defaultConfig {
  manageHook = manageDocks <+> (className =? "X-Plane" --> doFloat) <+> (className =? "Kerbal Space Program" --> doFloat) <+> manageHook defaultConfig
  , borderWidth = 2
  , normalBorderColor = "#839496"
  , focusedBorderColor = "#d33682"
  , layoutHook = myLayout
  , handleEventHook = handleEventHook defaultConfig <+> docksEventHook
  , terminal = "urxvt"
  } `additionalKeysP` myKeys

myPP = xmobarPP {
  ppCurrent = xmobarColor "white" "" . wrap "[" "]"
  , ppUrgent = xmobarColor "white" "red" . wrap "!" "!"
  , ppOrder = \(ws:l:t:_) -> [ws,l]
}

toggleStrutsKey :: XConfig t -> (KeyMask, KeySym)
toggleStrutsKey XConfig{XMonad.modMask = mod4Mask} = (mod4Mask, xK_b )

