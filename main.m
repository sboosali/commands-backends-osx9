#import <Cocoa/Cocoa.h>
#import <Carbon/Carbon.h>
#import "cbits/objc_actor.h"


int main(int argc, char** argv)
{
  // Automatic Reference Counting (ARC)
  @autoreleasepool {

  // type command-shift-n, into current application
    pressKey((kCGEventFlagMaskCommand | kCGEventFlagMaskControl), kVK_ANSI_B);

    setClipboard(currentApplicationPath());

    char * site  = "https://www.google.com/search?q=";
    const char * query = getClipboard();
    char * url = malloc(strlen(site) + strlen(query) + 1);
    strcpy(url, site);
    strcat(url, query);

    openURL(url);

    // Why sleep?
  [NSThread sleepForTimeInterval:(30 / 1000.0f)];

  // double-click the mouse while holding command, at current location
  // [Actor clickMouse:kCGEventLeftMouseDown and:kCGEventLeftMouseUp on:kCGMouseButtonLeft for:1 with:0];
}

  return 0;
}
