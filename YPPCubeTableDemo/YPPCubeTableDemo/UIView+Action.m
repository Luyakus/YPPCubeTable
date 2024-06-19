//
//  UIView+Action.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/19.
//
#import <Masonry.h>
#import <objc/runtime.h>
#import "UIView+Action.h"

@implementation UIView (Action)

static int ActionKey = 0;
static int ActionButtonTag = 10000000;
- (void)setAction:(void (^)(void))action {
    if (![self viewWithTag:ActionButtonTag]) {
        self.userInteractionEnabled = YES;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = ActionButtonTag;
        [btn addTarget:self action:@selector(__action) forControlEvents:UIControlEventTouchUpInside];
        if (self.subviews.count > 0) {
            [self insertSubview:btn belowSubview:self.subviews[0]];
        } else {
            [self addSubview:btn];
        }
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
    id block = [action copy];
    objc_setAssociatedObject(self, &ActionKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(void))action {
    return objc_getAssociatedObject(self, &ActionKey);
}


- (void)__action {
    if (self.action) {
        self.action();
    }
}
@end
