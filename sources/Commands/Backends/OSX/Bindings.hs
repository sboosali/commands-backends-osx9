{-# LANGUAGE ViewPatterns #-}
module Commands.Backends.OSX.Bindings where
import Commands.Backends.OSX.Types
import Commands.Backends.OSX.Bindings.Raw

import Foreign.C.String (peekCString) 


{- | 

no error handling

-}
pressKey :: KeyPress -> IO ()
pressKey (Press (encodeModifiers -> flags) (encodeKey -> key))
 = objc_pressKey flags key

-- {- | 

-- no error handling

-- -}
-- clickMouse :: MouseClick -> IO ()
-- clickMouse (Click (encodeModifiers -> flags) (encodePositive -> n) (encodeButton -> button)) = objc_clickMouse

{- | 

TODO Applications whose name/paths have Unicode characters may or may not marshall correctly.

-}
currentApplicationPath :: IO String
currentApplicationPath = objc_currentApplicationPath >>= peekCString
