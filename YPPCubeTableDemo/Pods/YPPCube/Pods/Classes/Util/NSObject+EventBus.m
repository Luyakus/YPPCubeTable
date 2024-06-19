//
//  NSObject+EventBus.m
//  Pods
//
//  Created by DZ0400843 on 2022/3/27.
//

#import "NSObject+EventBus.h"
#import <objc/runtime.h>
@interface NSObject (EventHandle)
@property (nonatomic, strong) YPPEventHandle *handle;

@end

@implementation NSObject (EventBus)

static NSInteger handleKey = 0;
- (void)setHandle:(YPPEventHandle *)handle {
    objc_setAssociatedObject(self, &handleKey, handle, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (YPPEventHandle *)handle {
    YPPEventHandle *hanlde = objc_getAssociatedObject(self, &handleKey);
    if (hanlde) return hanlde;
    __weak typeof(self)ws = self;
    hanlde = [YPPEventHandle handle:^(__kindof YPPEventHandle * _Nonnull it) {
        it.filter = ^BOOL(__kindof YPPEventMessage * _Nonnull message) {
            if ([ws respondsToSelector:@selector(canHandleMessage:)]) {
                return [ws canHandleMessage:message];
            }
            return NO;
        };
        
        it.handle = ^(__kindof YPPEventMessage * _Nonnull message) {
            if ([ws respondsToSelector:@selector(handleMessage:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [ws handleMessage:message];
                });
            }
        };
    }];
    self.handle = hanlde;
    return hanlde;
}

- (void)registEventBus:(__kindof YPPEventBus *)eventBus {
    if ([self respondsToSelector:@selector(canHandleMessage:)] &&
        [self respondsToSelector:@selector(handleMessage:)]) {
        [eventBus registHandle:self.handle];
    }
}

@end
