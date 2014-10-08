import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeysP)

main = do
    h <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
                 manageHook = manageDocks <+> manageHook defaultConfig
               , borderWidth = 3
               , normalBorderColor = "#eee8d5"
               , focusedBorderColor = "#dc322f"
               , layoutHook = avoidStruts $ layoutHook defaultConfig
               , terminal = "urxvt"
               , modMask = mod4Mask
               , logHook = dynamicLogWithPP $ xmobarPP {
                   ppOrder = \(ws:l:t:_) -> [ws,l]
                 , ppOutput = hPutStrLn h }
               } `additionalKeysP`
               [ ("M-f", spawn "firefox")
               , ("M-e", spawn "emacs")
               , ("M-s", spawn "skype")
               , ("M-v", spawn "vlc")
               ]
