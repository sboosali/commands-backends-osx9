import Commands.Backends.OSX.Types
import Commands.Backends.OSX.Bindings

import Control.Monad (replicateM_)
import Control.Concurrent (threadDelay)


main = do
 testChrome


markWord = do
 pressKey $ Press [Option       ] LeftArrowKey
 pressKey $ Press [Option, Shift] RightArrowKey

backWord = do
 pressKey $ Press [Option] LeftArrowKey

forWord = do
 pressKey $ Press [Option] RightArrowKey

-- 1,000,000 µs is 1s
delay = threadDelay $ 1000000

-- keyboard shortcuts don't need lag between each KeyPress (hence
-- 'replicateM_', without 'interleave $ delay 25000'). only
-- interaction needs lag (e.g. a mini-buffer pop-up).
-- tested in Chrome.
testChrome = do
 replicateM_ 5 delay
 replicateM_ 10 forWord
 delay
 replicateM_ 10 backWord
 delay
 markWord

