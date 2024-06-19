//
//  YPPEventMessage.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPPEventMessage : NSObject

@property (nonatomic, strong) id data;

@property (nonatomic, copy) NSString *from;

@property (nonatomic, copy) NSString *identifier;

+ (void)send:(void(^)(__kindof YPPEventMessage *it))config;

@end

NS_ASSUME_NONNULL_END
