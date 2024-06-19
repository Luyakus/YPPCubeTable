//
//  YPPHPresenter.m
//  YPPCube
//
//  Created by DZ0400843 on 2021/12/22.
//
#import "UIView+Cube.h"
#import "Masonry.h"
#import "YPPCubeConst.h"
#import "YPPHLayoutView.h"
#import "YPPHPresenter.h"

@interface YPPHPresenter()
@property (nonatomic, strong) YPPHLayoutView *view;
@end

@implementation YPPHPresenter
- (instancetype)init {
    if (self = [super init]) {
        self.view = [[YPPHLayoutView alloc] init];
        self.view.from = @"YPPHPresenter";
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
        CGFloat cubeWidth = [self.delegate elementSizeAtIndex:i].width;
        if (YPPViewIsFlex(cubeWidth)) {
            view.hFlex = YES;
        } else {
            view.hWidth = cubeWidth;
        }
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
        CGFloat cubeWidth = [self.delegate elementSizeAtIndex:index].width;
        if (YPPViewIsFlex(cubeWidth)) {
            view.hFlex = YES;
        } else {
            view.hWidth = cubeWidth;
        }
    }
    [self.view setNeedsLayout];
    [self.view setNeedsDisplay];
}

- (UIView *)holder {
    return self.view;
}

@end
