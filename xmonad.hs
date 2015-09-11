import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeysP)

main = do
    h <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
                 manageHook = manageDocks <+> manageHook defaultConfig
               , borderWidth = 1
               , normalBorderColor = "black"
               , focusedBorderColor = "white"
               , layoutHook = avoidStruts $ layoutHook defaultConfig
               , terminal = "urxvt"
               , logHook = dynamicLogWithPP $ xmobarPP {
                   ppCurrent = xmobarColor "black" "" . wrap "[" "]"
                 , ppOrder = \(ws:l:t:_) -> [ws,l]
                 , ppOutput = hPutStrLn h }
               } `additionalKeysP`
               [ ("M-c", spawn "/home/jds/bin/c")
               , ("M-e", spawn "emacs")
               , ("M-v", spawn "vlc")
               ]
