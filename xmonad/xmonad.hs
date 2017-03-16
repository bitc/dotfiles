import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import qualified XMonad.StackSet as W

main = do
    spawn "xsetroot -solid grey12"
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook
        , layoutHook = avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#ff8800" "" . shorten 160
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "xterm"
        , normalBorderColor = "#444444"
        , focusedBorderColor = "#ff8800"
        , borderWidth = 2
        }

myManageHook = composeAll . concat $
    [ [ title =? i --> (doF W.focusDown <+> doFloat) | i <- myClassFloats ]
    , [ title =? "xfce4-notifyd" --> doIgnore ]
    ]
    where
    myClassFloats = ["termview"]
