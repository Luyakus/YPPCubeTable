//
//  NSObject+EventBus.h
//  Pods
//
//  Created by DZ0400843 on 2022/3/27.
//

#import <Foundation/Foundation.h>
#import "YPPEventBus.h"
#import "YPPEventMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (EventBus)
- (void)registEventBus:(__kindof YPPEventBus *)eventBus;

- (BOOL)canHandleMessage:(__kindof YPPEventMessage *)message;
- (void)handleMessage:(__kindof YPPEventMessage *)message;
@end

NS_ASSUME_NONNULL_END
