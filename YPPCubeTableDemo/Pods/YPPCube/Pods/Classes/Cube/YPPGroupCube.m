//
//  YPPGroupCube.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPGroupCube.h"
#import <Masonry/Masonry.h>
#import "YPPCube+Private.h"
#import "YPPAbstractPresenter.h"

@interface YPPGroupCube ()

@property (nonatomic, strong) YPPAbstractPresenter *presenter;
@property (nonatomic, strong) UIView *view;

@end

@implementation YPPGroupCube
@synthesize hidden;

- (instancetype)initWithData:(id)data {
    if (self = [super initWithData:data]) {
        self.cubes = @[].mutableCopy;
        self.presenter = [[[self presenterClass] alloc] init];
        self.view = self.presenter.holder;
        self.presenter.delegate = self;
    }
    return self;
}

- (void)setupView:(UIView *)view {
    [super setupView:view];
    if (self.view.superview != view) {
        [view addSubview:self.view];
    }
    [self.view mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view);
    }];
}

- (void)onDisappear {
    [super onDisappear];
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj callOnDisappear];
    }];
}

- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    if (!self.superCube) {
        self.view.hidden = hidden;
    }
}

#pragma mark - method
- (void)reload {
    [super reload];
    [self.presenter reload];
}

- (void)reloadIndex:(NSInteger)index {
    [self.presenter reloadIndex:index];
}

#pragma mark - 协议
- (void)elementAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder {
    if (index < self.cubes.count) {
        YPPCube *cube = [self.cubes objectAtIndex:index];
        __weak typeof(self)ws = self;
        __weak typeof(cube)wb = cube;
        cube.reloadAciton = ^{
            if ([wb shouldDisplay]) {
                [ws reloadIndex:index];
            } else {
                [wb callOnUnMount];
                [ws.cubes removeObject:wb];
                [ws reload];
            }
        };
        if (!cube.superCube) {
            cube.superCube = self;
        }
        if (cube.superView != presentHolder) {
            [cube setupView:presentHolder];
        }
        if (cube.status == YPPCubeStatusInit) {
            [cube callOnload];
        }
        if (self.status == YPPCubeStatusOnDisappear) {
            [cube callOnDisappear];
        }
    }
}

- (CGSize)elementSizeAtIndex:(NSInteger)index {
    if (index < self.cubes.count) {
        YPPCube *cube = [self.cubes objectAtIndex:index];
        return CGSizeMake([cube cubeWidth], [cube cubeHeight]);
    }
    return CGSizeZero;
}

- (NSInteger)elementCount {
    return self.cubes.count;
}

- (void)elementWillAppearAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder {
    
}

- (void)elementDidAppearAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder {
    if (index < self.cubes.count) {
        YPPCube *cube = [self.cubes objectAtIndex:index];
        if (cube.superView != presentHolder) return;
        if (self.status != YPPCubeStatusOnDisappear) {
            [cube callOnAppear];
        }
    }
}

- (void)elementDidDisappearAtIndex:(NSInteger)index presentHolder:(nonnull UIView *)presentHolder {
    if (index < self.cubes.count) {
        YPPCube *cube = [self.cubes objectAtIndex:index];
        if (cube.superView != presentHolder) return;
        [cube callOnDisappear];
    }
}

#pragma mark - overwrite
- (Class)presenterClass {
    return YPPAbstractPresenter.class;
}

- (UIEdgeInsets)contentInsets {
    return UIEdgeInsetsZero;
}

#pragma mark - helper
- (UIView *)contentView {
    return self.view;
}

@end


#import "YPPVPresenter.h"
@implementation YPPVGroupCube
#pragma mark - overwrite

- (void)onAppear {
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull cube, NSUInteger idx, BOOL * _Nonnull stop) {
        [cube callOnAppear];
    }];
}

- (Class)presenterClass {
    return YPPVPresenter.class;
}
@end


#import "YPPHPresenter.h"
@implementation YPPHGroupCube
- (void)onAppear {
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull cube, NSUInteger idx, BOOL * _Nonnull stop) {
        [cube callOnAppear];
    }];
}

- (Class)presenterClass {
    return YPPHPresenter.class;
}

@end

#import "YPPZPresenter.h"
@implementation YPPZGroupCube
- (void)onAppear {
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull cube, NSUInteger idx, BOOL * _Nonnull stop) {
        [cube callOnAppear];
    }];
}

- (Class)presenterClass {
    return YPPZPresenter.class;
}
@end


#import "YPPTablePresenter.h"
@implementation YPPGroupScrollCube
#pragma mark - overwrite
- (Class)presenterClass {
    return YPPTablePresenter.class;
}

#pragma mark - getter
- (UIScrollView *)scrollView {
    return ((YPPTablePresenter *)self.presenter).scrollView;
}
@end
