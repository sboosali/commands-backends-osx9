# # # # # # # # # # # # # # # # # # 

default: check

run:
	cabal configure
	cabal run

check:
	cabal build --ghc-options="-fforce-recomp -fno-code"


# # # # # # # # # # # # # # # # # # 

Objective-C: main
	./main

main: main.m cbits/objc_actor.m
	gcc -ObjC  -framework Cocoa  -o ./main  $^

# # # # # # # # # # # # # # # # # # 

clean:
	rm -f main

.PHONY: default clean

