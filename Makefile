
run:
	cabal configure -v3
	cabal run

check:
	cabal build --ghc-options="-fforce-recomp -fno-code"


# # # # # # # # # # # # # # # # # # 

Objective-C: main
	./main

main: main.m actor.m
	gcc -ObjC  -framework Cocoa  -o ./main  $^

# # # # # # # # # # # # # # # # # # 

default: check

clean:
	rm -f main

.PHONY: default clean

