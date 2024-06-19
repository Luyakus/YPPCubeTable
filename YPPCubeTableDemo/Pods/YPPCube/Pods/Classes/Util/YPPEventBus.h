//
//  YPPEventBus.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import "YPPEventMessage.h"
#import "YPPEventHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface YPPEventBus : NSObject

- (void)registHandle:(__kindof YPPEventHandle *)handle;

- (void)dispatchMessage:(__kindof YPPEventMessage *)message;

@end

NS_ASSUME_NONNULL_END
