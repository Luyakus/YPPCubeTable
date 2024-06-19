//
//  YPPVLayoutView.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//
#import <Masonry/Masonry.h>
#import "UIView+Cube.h"
#import "YPPVLayoutView.h"
#import "YPPCubeConst.h"

@implementation YPPVLayoutView

- (void)layoutSubviews {
    UIView *pre = nil;
    UIView *flexPre = nil;
    NSInteger endIndex = self.subviews.count - 1;
    NSInteger count = self.subviews.count;
    __block BOOL hasFlexItem = NO;
    for (int i = 0; i < count; i ++) {
        UIView *v = [self.subviews objectAtIndex:i];
        CGFloat height = v.vHeight;
        [v mas_remakeConstraints:^(MASConstraintMaker *make) {
            if (pre) {
                make.top.equalTo(pre.mas_bottom);
            } else {
                make.top.equalTo(self);
            }
            make.left.right.equalTo(self);
            if (v.vFlex) {
                hasFlexItem = YES;
                if (flexPre) {
                    make.height.equalTo(flexPre);
                }
            } else {
                make.height.mas_equalTo(height);
            }
            if (i == endIndex) {
                if (hasFlexItem) {
                    make.bottom.equalTo(self);
                }
            }
        }];
        if (v.vFlex) {
            flexPre = v;
        }
        pre = v;
    }
}

@end
