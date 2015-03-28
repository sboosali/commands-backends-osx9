module Main where
import Commands

main = return ()


data Application
 = Global
 | GoogleChrome
 | Emacs
 | Terminal
 deriving (Show,Read,Eq,Ord)
