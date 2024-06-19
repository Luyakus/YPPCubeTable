//
//  UIView+Cube.m
//  YPPCube
//
//  Created by DZ0400843 on 2021/12/22.
//
#import <objc/runtime.h>
#import "UIView+Cube.h"


@implementation UIView (Cube)

static NSInteger vFlexKey = 0;
- (void)setVFlex:(BOOL)cubeVFlex {
    objc_setAssociatedObject(self, &vFlexKey, @(cubeVFlex), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vFlex {
    BOOL result = [objc_getAssociatedObject(self, &vFlexKey) boolValue];
    return result;
}

static NSInteger vHeightKey = 0;
- (void)setVHeight:(CGFloat)vHeight {
    objc_setAssociatedObject(self, &vHeightKey, @(vHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)vHeight {
    return [objc_getAssociatedObject(self, &vHeightKey) floatValue];
}

static NSInteger hFlexKey = 0;
- (void)setHFlex:(BOOL)cubeHFlex {
    objc_setAssociatedObject(self, &hFlexKey, @(cubeHFlex), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hFlex {
    BOOL result = [objc_getAssociatedObject(self, &hFlexKey) boolValue];
    return result;
}

static NSInteger hWidthKey = 0;
- (void)setHWidth:(CGFloat)hWidth {
    objc_setAssociatedObject(self, &hWidthKey, @(hWidth), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)hWidth {
    return [objc_getAssociatedObject(self, &hWidthKey) floatValue];
}

@end
