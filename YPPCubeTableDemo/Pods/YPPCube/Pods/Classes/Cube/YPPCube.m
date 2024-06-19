//
//  YPPCube.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPCube.h"
#import "YPPCubeConst.h"
#import "YPPCube+Private.h"

@interface YPPCube () <YPPDataSourceProtocol>

@property (nonatomic, strong) YPPDataSource *dataSource;

@end

@implementation YPPCube

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.status = YPPCubeStatusInit;
        self.dataSource = [[[self dataSourceClass] alloc] init];
        self.dataSource.delegate = self;
    }
    return self;
}

- (void)setupView:(UIView *)view {
    self.superView = view;
}

- (void)onLoad {
    
}

- (void)onAppear {
    
}

- (void)onDisappear {
    
}

- (void)onUnMount {
}

- (void)setHidden:(BOOL)hidden {
    _hidden = hidden;
    if (self.superCube) {
        self.superView.hidden = hidden;
    }
    [self.superView setNeedsDisplay];
}

#pragma mark - method
- (void)fillData:(id)data {
    [self.dataSource fillData:data];
}

- (void)reload {
    if (self.reloadAciton) {
        self.reloadAciton();
    }
}
#pragma mark - 协议
- (void)dataDidChanged:(NSString *)from {
    
}

#pragma mark - overwite
- (Class)dataSourceClass {
    return [YPPDataSource class];
}

- (CGFloat)cubeHeight {
    return YPPViewFlex;
}

- (CGFloat)cubeWidth {
    return YPPViewFlex;
}

- (BOOL)shouldDisplay {
    return YES;
}
#pragma mark - getter

- (void)dealloc {
    YPPCube *cube = self;
    [self.superView removeFromSuperview];
    [cube callOnUnMount];
}

@end
