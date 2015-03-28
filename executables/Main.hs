{-# OPTIONS_GHC -fno-warn-missing-signatures -fno-warn-unused-binds -fno-warn-unused-matches #-}
import Commands.Backends.OSX.Types
import Commands.Backends.OSX.Bindings

import Control.Monad (replicateM_)
import Control.Concurrent (threadDelay)


main = do
 -- testChrome
 currentApplicationPath >>= print
 delay 30
 pressKey $ Press [Command, Shift] BKey
 delay 1000
 pressKey $ Press [Command] DownArrowKey

markWord = do
 pressKey $ Press [Option       ] LeftArrowKey
 pressKey $ Press [Option, Shift] RightArrowKey

backWord = do
 pressKey $ Press [Option] LeftArrowKey

forWord = do
 pressKey $ Press [Option] RightArrowKey

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

