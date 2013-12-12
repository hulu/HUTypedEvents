//
//  HUTypedEvents.h
//  HUTypedEvents
//
//  Created by Bao Lei on 4/5/13.
//

#ifndef HUTypedEventHelpers_h
#define HUTypedEventHelpers_h


#define HUDeclareEvent(EventName, Params) \
@protocol EventName <NSObject> \
- (void)handle ## EventName ## _ ## Params; \
@end \


#define HUDeclareEventRegistration(EventName, Params) \
@property (nonatomic) NSMutableArray* listenerArrayFor ## EventName; \
- (void)register ## EventName ## _observer:(id < EventName > )object; \
- (void)handle ## EventName ## _ ## Params; \


#define HUImplementEvent(EventName, Params) \
- (NSMutableArray*)listenerArrayFor ## EventName { \
    if (!_listenerArrayFor ## EventName) { \
        _listenerArrayFor ## EventName = [NSMutableArray new]; \
    } \
    return _listenerArrayFor ## EventName; \
} \
- (void)register ## EventName ## _observer:(id)object { \
    if (![object conformsToProtocol:@protocol(EventName)]) { return; } \
    HUTypedEventListener* listener = [HUTypedEventListener new]; \
    listener.object = object; \
    [self.listenerArrayFor ## EventName addObject:listener]; \
} \
- (void)enumerateObjectsFor ## EventName ## WithBlock:(void(^)(id object))block { \
    NSMutableArray* array = _listenerArrayFor ## EventName ; \
    for (int i = (int)array.count - 1; i >= 0; i --) { \
        HUTypedEventListener* listener = [array objectAtIndex:i]; \
        if (listener.object && [listener.object conformsToProtocol:@protocol(EventName)]) { \
            block(listener.object); \
        } \
        else { \
            [array removeObjectAtIndex:i];\
        } \
    } \
} \
- (void)handle ## EventName ## _ ## Params { \
    [self enumerateObjectsFor ## EventName ## WithBlock:^(id object) { \
        [object handle ## EventName ## _ ## Params]; \
    }]; \
} \


#define HUDeclareSingleton(classname)\
+ (classname *)instance;

#define HUImplementSingleton(classname) \
+ (classname *)instance { \
    static dispatch_once_t pred; \
    __strong static classname * sharedObject = nil; \
    dispatch_once( &pred, ^{ \
        sharedObject = [[self alloc] init]; }); \
    return sharedObject; \
} \



#endif


@interface HUTypedEventListener : NSObject

@property (nonatomic, weak) id object;

@end
