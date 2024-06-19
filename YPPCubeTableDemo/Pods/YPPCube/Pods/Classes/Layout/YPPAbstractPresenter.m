//
//  YPPAbstractPresenter.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPAbstractPresenter.h"

@implementation YPPAbstractPresenter

- (UIScrollView *)scrollView {
    NSAssert(nil, @"不要直接使用此类, 子类化使用");
    return nil;
}

- (void)reload {
    NSAssert(nil, @"不要直接使用此类, 子类化使用");
}

- (void)reloadIndex:(NSInteger)index {
    NSAssert(nil, @"不要直接使用此类, 子类化使用");
}

- (UIView *)holder {
    return nil;
}

@end
