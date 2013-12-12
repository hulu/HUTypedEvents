
Purpose
=======

While NSNotification is easy to use, it has the following drawbacks:

1. The compiler can't check if the notification name is valid
2. The user has to figure out all the parameters hidden inside the userInfo
3. The notification object and all the parameters are weakly typed
4. There is almost no Xcode autocompletion when triggering or handling notifications
5. To send over a primitive value, you have to wrap it into an object (e.g. NSNumber for int)

HUTypedEvents provides an alternative solution to passing events in Objective C. The events are based on methods, and all the parameters are strongly typed. All the event triggering and handling code can take the advantage of compiler check and Xcode autocompletion.


Usage
=====

## 0. Installation

`HUTypedEvents` is on CocoaPods.

```
pod install HUTypedEvents
```

### Assumptions

There is an event called EventX, it passes two params: (int)x and (float)y
 
## 1. Define the event

Create a centralized event handler class, make it a singleton and declare/implement the event logic through the helper methods:
 
CentralHandler.h:

    HUDeclareEvent(EventX, x:(int)x y:(float)y)
    
    @interface CentralHandler : NSObject
    
    HUDeclareSingleton(CentralHandler);
    HUDeclareEventRegistation(EventX, x:(int)x y:(float)y);
    
    @end
 
CentralHandler.m:
 
    @implementation CentralHandler : NSObject <ProtocolForEventB>
    
    HUImplementSingleton(CentralHandler);
    HUImplementEvent(EventX, x:(int)x y:(float)y);
    
    @end
 
## 2. Raise the event from any object

Call this anywhere:

    [[CentralHandler instance] handleEventX_x:someX y:someY];
 
## 3. Register an object to be a listener of this event
 
Make the object conform to EventX, and implement the protocol method

    - (void) handleEventX_x:(int)x y:(float)y;
 
In the initialization method, call:

    [[CentralHandler instance] registerEventX_object:self];

