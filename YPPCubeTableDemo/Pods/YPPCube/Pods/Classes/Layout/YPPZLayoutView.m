//
//  YPPLayerView.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPZLayoutView.h"
#import <Masonry/Masonry.h>

@implementation YPPZLayoutView

- (void)layoutSubviews {
    for (UIView *view in self.subviews) {
        [view mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];
    }
}

@end
