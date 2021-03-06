module Commands.Backends.OSX.Types where

import Foreign.C.Types


{- | relates a Haskell type with a Objective-C type:

* Objective-C defines @typedef unsigned short uint16_t;@
* line 34 of </System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/CoreGraphics.framework/Versions/A/Headers/CGRemoteOperation.h> defines @typedef uint16_t CGKeyCode;@


-}
type CGKeyCode     = CUShort

{- | relates a Haskell type with a Objective-C type:

* Objective-C defines @typedef unsigned long long uint64_t;@
* line 98 of </System/Library/Frameworks/ApplicationServices.framework/Versions/A/Frameworks/CoreGraphics.framework/Versions/A/Headers/CGEventTypes.h> defines @typedef uint64_t CGEventFlags;@


-}
type CGEventFlags  = CULLong

-- {- | relates a Haskell type with a Objective-C type:


-- -}
-- type CGEventType   =

-- {- | relates a Haskell type with a Objective-C type:


-- -}
-- type CGMouseButton =

-- data MouseClick = MouseClick [Modifier] Positive MouseButton
--  deriving (Show,Eq,Ord)

-- data MouseButton = LeftButton | MiddleButton | RightButton
--  deriving (Show,Eq,Ord,Enum)

-- type Positive = Int

{- |

@Press [Command, Shift] AKey@ is easy to read, and
@Press []@ is natural to partially apply

-}
data KeyPress = KeyPress [Modifier] Key
 deriving (Show,Eq,Ord)

{- | modifier keys are keys that can be "held".

the escape key is "pressed", not "held", it seems. 
(possibly explains its behavior in your terminal emulator?)

-}
data Modifier = Command | Control | Shift | Option | Function
 deriving (Show,Eq,Ord,Enum)

{- | all the keys on a standard keyboard.


-}
data Key

 = CommandKey
 | ControlKey
 | CapsLockKey
 | ShiftKey
 | OptionKey
 | FunctionKey

 | GraveKey
 | MinusKey
 | EqualKey
 | DeleteKey
 | ForwardDeleteKey
 | LeftBracketKey
 | RightBracketKey
 | BackslashKey
 | SemicolonKey
 | QuoteKey
 | CommaKey
 | PeriodKey
 | SlashKey

 | TabKey
 | SpaceKey
 | ReturnKey

 | LeftArrowKey
 | RightArrowKey
 | DownArrowKey
 | UpArrowKey

 | AKey
 | BKey
 | CKey
 | DKey
 | EKey
 | FKey
 | GKey
 | HKey
 | IKey
 | JKey
 | KKey
 | LKey
 | MKey
 | NKey
 | OKey
 | PKey
 | QKey
 | RKey
 | SKey
 | TKey
 | UKey
 | VKey
 | WKey
 | XKey
 | YKey
 | ZKey

 | ZeroKey
 | OneKey
 | TwoKey
 | ThreeKey
 | FourKey
 | FiveKey
 | SixKey
 | SevenKey
 | EightKey
 | NineKey

 | EscapeKey
 | F1Key
 | F2Key
 | F3Key
 | F4Key
 | F5Key
 | F6Key
 | F7Key
 | F8Key
 | F9Key
 | F10Key
 | F11Key
 | F12Key
 | F13Key
 | F14Key
 | F15Key
 | F16Key
 | F17Key
 | F18Key
 | F19Key
 | F20Key

 deriving (Show,Eq,Ord)
