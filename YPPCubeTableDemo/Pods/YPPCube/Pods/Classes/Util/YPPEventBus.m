//
//  YPPEventBus.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPEventBus.h"

@interface YPPEventBus ()

@property (nonatomic, strong) dispatch_queue_t queue;
@property (nonatomic, strong) NSHashTable *handles;

@end

@implementation YPPEventBus

- (instancetype)init {
    if (self = [super init]) {
        self.queue = dispatch_queue_create("YPPEventBus", DISPATCH_QUEUE_SERIAL);
        self.handles = [[NSHashTable alloc] initWithOptions:NSHashTableWeakMemory capacity:100];
    }
    return self;
}

- (void)registHandle:(__kindof YPPEventHandle *)handle {
    if (!handle) return;
    dispatch_async(self.queue, ^{
        [self.handles addObject:handle];
    });
}

- (void)dispatchMessage:(__kindof YPPEventMessage *)message {
    dispatch_async(self.queue, ^{
        for (YPPEventHandle *h in self.handles) {
            if (!h || !h.handle) continue;
            if (!h.filter || h.filter(message)) {
                h.handle(message);
            }
        }
    });
}

@end
