//
//  YPPEventHandle.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import "YPPEventMessage.h"

NS_ASSUME_NONNULL_BEGIN

#define YPPDo for(int ___i = 0; ___i < 1; ___i ++)

@interface YPPEventHandle : NSObject

@property (nonatomic, copy) void(^handle)(__kindof YPPEventMessage *message);

@property (nonatomic, copy) BOOL(^filter)(__kindof YPPEventMessage *message); // 询问是否响应 message

+ (__kindof YPPEventHandle *)handle:(void(^)(__kindof YPPEventHandle *it))config;

@end

NS_ASSUME_NONNULL_END
