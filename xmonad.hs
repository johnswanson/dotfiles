import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig(additionalKeysP)

myWorkspaces    = ["1:code", "2:web"] ++ map show [3..5] ++ ["6:cal", "7:chat", "8:gmail", "9:trello"]

main = do
    h <- spawnPipe "xmobar"
    xmonad $ defaultConfig {
                 manageHook = manageDocks <+> manageHook defaultConfig
               , borderWidth = 2
               , normalBorderColor = "#839496"
               , focusedBorderColor = "#d33682"
               , workspaces = myWorkspaces
               , layoutHook = avoidStruts $ layoutHook defaultConfig
               , terminal = "urxvt"
               , logHook = dynamicLogWithPP $ xmobarPP {
                   ppCurrent = xmobarColor "red" "" . wrap "[" "]"
                 , ppOrder = \(ws:l:t:_) -> [ws,l]
                 , ppOutput = hPutStrLn h }
               } `additionalKeysP`
               [ ("M-c", spawn "/home/jds/bin/c")
               , ("M-e", spawn "emacs")
               , ("M-v", spawn "vlc")
               ]
