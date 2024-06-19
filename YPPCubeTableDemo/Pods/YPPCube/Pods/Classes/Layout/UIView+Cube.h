//
//  UIView+Cube.h
//  YPPCube
//
//  Created by DZ0400843 on 2021/12/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 出现约束报错, 使用 UIViewAlertForUnsatisfiableConstraints 符号断点查看调用");
@interface UIView (Cube)

@property (nonatomic, assign) BOOL vFlex;
@property (nonatomic, assign) BOOL hFlex;

@property (nonatomic, assign) CGFloat hWidth;
@property (nonatomic, assign) CGFloat vHeight;
@end


NS_ASSUME_NONNULL_END
