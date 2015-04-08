import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Layout.NoBorders(smartBorders)
import System.IO
import qualified XMonad.StackSet as W

main = do
    spawn "xsetroot -solid grey12"
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> myManageHook
        , layoutHook = smartBorders (avoidStruts  $  layoutHook defaultConfig)
        , logHook = dynamicLogWithPP $ xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "#ff8800" "" . shorten 60
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        , terminal = "instantrun urxvt"
        , normalBorderColor = "#444444"
        , focusedBorderColor = "#ff8800"
        , borderWidth = 2
        }

myManageHook = composeAll . concat $
    [
        [ title =? i --> (doF W.focusDown <+> doFloat) | i <- myClassFloats ]
    ]
    where
    myClassFloats = ["termview"]
