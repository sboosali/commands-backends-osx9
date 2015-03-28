{-# LANGUAGE ForeignFunctionInterface #-}
module Commands.Backends.OSX.Bindings.Raw where
import Commands.Backends.OSX.Types

import Foreign.C.Types (CString,UInt32)


foreign import ccall safe "objc_actor.h pressKey"               objc_pressKey
 :: CGKeyCode
 -> CGEventFlags
 -> IO ()

-- foreign import ccall safe "objc_actor.h clickMouse"             objc_clickMouse
--  :: CGEventType
--  -> CGEventType
--  -> CGMouseButton
--  -> UInt32
--  -> CGEventFlags
--  -> IO ()

foreign import ccall safe "objc_actor.h currentApplicationPath" objc_currentApplicationPath
 :: IO CString
