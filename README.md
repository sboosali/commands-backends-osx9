OSX `Backend` for the `commands` package
========================================

simple Objective-C bindings for Haskell to press keys and click the mouse on OSX 9.

Haskell's C FFI seems to have an overhead of only microseconds. the frequency of the calls to this API will be no more than 1000 per second, and mostly less than 10Hz:

 * 1 (e.g. a click)
 * 10 (e.g. sequenced keyboard shortcuts)
 * 100 (e.g. to type out a dictated sentence keypress by keypress)

