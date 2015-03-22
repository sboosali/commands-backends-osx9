# # # # # # # # # # # # # # # # # # 

Objective-C: main
	./main

main: main.m actor.m
	gcc -ObjC  -framework Cocoa  -o ./main  $^

# # # # # # # # # # # # # # # # # # 

default: Objective-C

clean:
	rm -f main

.PHONY: Objective-C main default clean

# # # # # # # # # # # # # # # # # # 
