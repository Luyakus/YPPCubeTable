//
//  YPPHLayoutView.m
//  YPPCube
//
//  Created by DZ0400843 on 2021/12/22.
//
#import <Masonry/Masonry.h>
#import "UIView+Cube.h"
#import "YPPHLayoutView.h"

@implementation YPPHLayoutView
- (void)layoutSubviews {
    UIView *pre = nil;
    UIView *flexPre = nil;
    NSInteger endIndex = self.subviews.count - 1;
    NSInteger count = self.subviews.count;
    __block BOOL hasFlexItem = NO;
    for (int i = 0; i < count; i ++) {
        UIView *v = [self.subviews objectAtIndex:i];
        CGFloat width = v.hWidth;
        [v mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (pre) {
                make.left.equalTo(pre.mas_right);
            } else {
                make.left.equalTo(self);
            }
            make.top.bottom.equalTo(self);
            if (v.hFlex) {
                hasFlexItem = YES;
                if (flexPre) {
                    make.width.equalTo(flexPre);
                }
            } else {
                make.width.mas_equalTo(width);
            }
            if (i == endIndex) {
                if (hasFlexItem) {
                    make.right.equalTo(self);
                }
            }
        }];
        if (v.hFlex) {
            flexPre = v;
        }
        pre = v;
    }
}

@end
