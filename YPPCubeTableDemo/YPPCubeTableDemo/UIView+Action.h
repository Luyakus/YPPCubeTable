//
//  UIView+Action.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Action)
@property (nonatomic, copy) void(^action)(void);

@end

NS_ASSUME_NONNULL_END
