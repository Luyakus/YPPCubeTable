//
//  YPPCommand.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPPCommand : NSObject

@property (nonatomic, copy) NSString *from;

@property (nonatomic, copy) id data;

+ (void)excute:(void(^)(__kindof YPPCommand *it))config;

- (void)excute;

@end

NS_ASSUME_NONNULL_END
