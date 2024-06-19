//
//  YPPLinearPresenter.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//
#import "UIView+Cube.h"
#import "YPPVPresenter.h"
#import "Masonry.h"
#import "YPPVLayoutView.h"
#import "YPPCubeConst.h"

@interface YPPVPresenter ()

@property (nonatomic, strong) YPPVLayoutView *view;

@end

@implementation YPPVPresenter

- (instancetype)init {
    if (self = [super init]) {
        self.view = [[YPPVLayoutView alloc] init];
        self.view.from = @"YPPVPresenter";
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
        CGFloat cubeHeight = [self.delegate elementSizeAtIndex:i].height;
        if (YPPViewIsFlex(cubeHeight)) {
            view.vFlex = YES;
        } else {
            view.vHeight = cubeHeight;
        }
        [self.delegate elementDidAppearAtIndex:i presentHolder:view];
        [self.view addSubview:view];
    }
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

- (void)reloadIndex:(NSInteger)index {
    if (![self.delegate conformsToProtocol:@protocol(YPPPresenterProtocol)]) return;
    if ([self.delegate elementCount] != self.view.subviews.count) return;
    if (index < self.view.subviews.count) {
        UIView *view = [self.view.subviews objectAtIndex:index];
        [self.delegate elementAtIndex:index presentHolder:view];
        CGFloat cubeHeight = [self.delegate elementSizeAtIndex:index].height;
        if (YPPViewIsFlex(cubeHeight)) {
            view.vFlex = YES;
        } else {
            view.vHeight = cubeHeight;
        }
    }
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

- (UIView *)holder {
    return self.view;
}

@end
