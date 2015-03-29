{-# LANGUAGE ViewPatterns #-}
module Commands.Backends.OSX.Bindings where
import Commands.Backends.OSX.Types
import Commands.Backends.OSX.Bindings.Raw
import Commands.Backends.OSX.Marshall

import Foreign.C.String (peekCString,withCString) 


-- | 
-- TODO Applications whose name/paths have Unicode characters may or may not marshall correctly.
currentApplicationPath :: IO String
currentApplicationPath = objc_currentApplicationPath >>= peekCString

-- | 
pressKey :: KeyPress -> IO ()
pressKey (KeyPress (encodeModifiers -> flags) (encodeKey -> key))
 = objc_pressKey flags key

-- -- | 
-- clickMouse :: MouseClick -> IO ()
-- clickMouse (MouseClick (encodeModifiers -> flags) (encodePositive -> n) (encodeButton -> button)) = objc_clickMouse

-- | 
getClipboard :: IO String
getClipboard = objc_getClipboard >>= peekCString

-- | 
setClipboard :: String -> IO ()
setClipboard s = withCString s objc_setClipboard

-- | 
openURL :: String -> IO ()
openURL s = withCString s objc_openURL

