//
//  YPPAxis.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPAxis.h"
#import <Masonry/Masonry.h>
#import "YPPVLayoutView.h"
#import "YPPCube+Private.h"
#import "YPPDataSource.h"
#import "YPPZLayoutView.h"

@interface YPPAxis () <YPPDataSourceProtocol>

@property (nonatomic, strong) YPPDataSource *dataSource;
@property (nonatomic, strong) NSMutableArray <YPPCube *> *cubes;
@property (nonatomic, strong) YPPZLayoutView *layerView;

@end

@implementation YPPAxis

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.cubes = @[].mutableCopy;
        self.layerView = [[YPPZLayoutView alloc] initWithFrame:CGRectZero];
        self.dataSource = [[[self dataSourceClass] alloc] init];
        self.dataSource.delegate = self;
    }
    return self;
}

- (void)setupView:(UIView *)rootview {
    if (self.layerView.superview != rootview) {
        [rootview addSubview:self.layerView];
        [self.layerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(rootview);
        }];
    }
}

#pragma mark - 生命周期
- (void)onLoad {
    
}

- (void)onAppear {
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull cube, NSUInteger idx, BOOL * _Nonnull stop) {
        [cube callOnAppear];
    }];
}

- (void)onDisappear {
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull cube, NSUInteger idx, BOOL * _Nonnull stop) {
        [cube callOnDisappear];
    }];
}

- (void)dealloc {
    NSLog(@"%@-----已释放", self.class);
}

#pragma mark - method
- (void)reload {
    [self.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull cube, NSUInteger idx, BOOL * _Nonnull stop) {
        __weak typeof(self)ws = self;
        __weak typeof(cube)wb = cube;
        cube.reloadAciton = ^{
            if ([wb shouldDisplay]) {
                [ws reload];
            } else {
                [wb callOnUnMount];
                [ws.cubes removeObject:wb];
                [ws reload];
            }
        };
        if (cube.superView != self.layerView) {
            [cube setupView:self.layerView];
        }
        if (cube.status == YPPCubeStatusInit) {
            [cube callOnload];
        }
        if (self.status == YPPCubeStatusOnAppear) {
            [cube callOnAppear];
        }
        if (self.status == YPPCubeStatusOnDisappear) {
            [cube callOnDisappear];
        }
    }];
}

- (void)callOnload {
    self.status = YPPAxisStatusOnload;
    [self onLoad];
}

- (void)callOnAppear {
    self.status = YPPAxisStatusOnAppear;
    [self onAppear];
}

- (void)callOnDisappear {
    self.status = YPPAxisStatusOnDisappear;
    [self onDisappear];
}

#pragma mark - YPPDataSourceProtocol
- (void)dataDidChanged:(NSString *)from {
    
}

#pragma mark - getter
- (Class)dataSourceClass {
    return [YPPDataSource class];
}

@end
