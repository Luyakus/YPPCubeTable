//
//  YPPZPresenter.m
//  YPPCube
//
//  Created by DZ0400843 on 2021/12/22.
//
#import "UIView+Cube.h"
#import "YPPZLayoutView.h"
#import "YPPZPresenter.h"

@interface YPPZPresenter()
@property (nonatomic, strong) YPPZLayoutView *view;
@end

@implementation YPPZPresenter

- (instancetype)init {
    if (self = [super init]) {
        self.view = [[YPPZLayoutView alloc] init];
        self.view.from = @"YPPZLayoutView";
    }
    return self;
}

- (void)reload {
    if (![self.delegate conformsToProtocol:@protocol(YPPPresenterProtocol)]) return;
    for (UIView *subview in self.view.subviews) {
        [subview removeFromSuperview];
    }
    NSInteger count = [self.delegate elementCount];
    for (int i = 0; i < count; i ++) {
        UIView *view = [[UIView alloc] init];
        [self.delegate elementAtIndex:i presentHolder:view];
        [self.delegate elementDidAppearAtIndex:i presentHolder:view];
        [self.view addSubview:view];
    }
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

- (void)reloadIndex:(NSInteger)index {
    if ([self.delegate elementCount] != self.view.subviews.count) return;
    if (index < self.view.subviews.count) {
        UIView *view = [self.view.subviews objectAtIndex:index];
        [self.delegate elementAtIndex:index presentHolder:view];
    }
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

- (UIView *)holder {
    return self.view;
}

@end
