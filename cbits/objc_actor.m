#import <Cocoa/Cocoa.h>

#import "objc_actor.h"


const char * currentApplicationPath() {
 return [[[[NSWorkspace
  sharedWorkspace]
   activeApplication]
    objectForKey:@"NSApplicationPath"]
     cStringUsingEncoding:NSUTF8StringEncoding];
}

ProcessSerialNumber currentApplicationPSN() {

  NSDictionary *appInfo = [[NSWorkspace sharedWorkspace] activeApplication];
  ProcessSerialNumber psn;
  psn.highLongOfPSN = [[appInfo objectForKey:@"NSApplicationProcessSerialNumberHigh"] unsignedIntValue];
  psn.lowLongOfPSN  = [[appInfo objectForKey:@"NSApplicationProcessSerialNumberLow"]  unsignedIntValue];

  return psn;
}

void pressKey(CGEventFlags modifiers, CGKeyCode key) {

    // events to press a key
    CGEventRef event1 = CGEventCreateKeyboardEvent(NULL, key, true);  // key down
    CGEventRef event2 = CGEventCreateKeyboardEvent(NULL, key, false); // key up

    // add modifiers to event
    CGEventSetFlags(event1, modifiers);
    CGEventSetFlags(event2, modifiers);

    // get the handle thing
    ProcessSerialNumber psn = currentApplicationPSN();

    // send keyboard event to application process (a quartz event)
    CGEventPostToPSN(&psn, event1);
    CGEventPostToPSN(&psn, event2);

    // release memory (do I need to?)
// event1
// event2
// psn

}
