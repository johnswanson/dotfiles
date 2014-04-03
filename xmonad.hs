import XMonad
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run

main = xmonad =<< xmobar myConfig

myConfig = defaultConfig
	{ manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , terminal = "urxvt"
    , modMask = mod4Mask
	}
