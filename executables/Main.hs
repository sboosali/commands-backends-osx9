{-# OPTIONS_GHC -fno-warn-missing-signatures -fno-warn-unused-binds -fno-warn-unused-matches #-}
import Commands.Backends.OSX.Types
import Commands.Backends.OSX.Bindings

import Control.Monad (replicateM_)
import Control.Concurrent (threadDelay)
import Data.Monoid                    ((<>))


main = do
 -- testChrome

 delay 30
 pressKey $ KeyPress [Command, Shift] BKey
 delay 1000
 pressKey $ KeyPress [Command] DownArrowKey

 app <- currentApplicationPath
 setClipboard app
 s <- getClipboard
 openURL $ "https://www.google.com/search?q=" <> s


markWord = do
 pressKey $ KeyPress [Option       ] LeftArrowKey
 pressKey $ KeyPress [Option, Shift] RightArrowKey

backWord = do
 pressKey $ KeyPress [Option] LeftArrowKey

forWord = do
 pressKey $ KeyPress [Option] RightArrowKey

-- 1,000,000 µs is 1s
delay i = threadDelay $ i*1000

-- keyboard shortcuts don't need lag between each KeyPress (hence
-- 'replicateM_', without 'interleave $ delay 25000'). only
-- interaction needs lag (e.g. a mini-buffer pop-up).
-- tested in Chrome.
testChrome = do
 delay 5000
 replicateM_ 10 forWord
 delay 1000
 replicateM_ 10 backWord
 delay 1000
 markWord

