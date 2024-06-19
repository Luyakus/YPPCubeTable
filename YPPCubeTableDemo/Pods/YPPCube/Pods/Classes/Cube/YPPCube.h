//
//  YPPCube.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YPPCubeConst.h"
#import "YPPDataSource.h"

typedef NS_ENUM(NSUInteger, YPPCubeStatus) {
    YPPCubeStatusInit,
    YPPCubeStatusOnLoad,
    YPPCubeStatusOnAppear,
    YPPCubeStatusOnDisappear,
    YPPCubeStatusOnUnMount,
};

NS_ASSUME_NONNULL_BEGIN

@interface YPPCube : NSObject <YPPDataSourceProtocol>

@property (nonatomic, readonly) __kindof YPPDataSource *dataSource;
@property (nonatomic, assign) YPPCubeStatus status;
@property (nonatomic, assign) BOOL hidden;


- (instancetype)init NS_UNAVAILABLE;

// call back
- (void)onLoad NS_REQUIRES_SUPER;

- (void)onAppear NS_REQUIRES_SUPER;

- (void)onDisappear NS_REQUIRES_SUPER;

- (void)onUnMount NS_REQUIRES_SUPER;

// overwrite
- (instancetype)initWithData:(nullable id)data NS_REQUIRES_SUPER;

- (void)setupView:(UIView *)view NS_REQUIRES_SUPER;

- (void)fillData:(id)data NS_REQUIRES_SUPER;

- (CGFloat)cubeHeight;

- (CGFloat)cubeWidth;

- (Class)dataSourceClass;

- (BOOL)shouldDisplay; // 是否要添加到屏幕上

// method
- (void)reload;

@end

NS_ASSUME_NONNULL_END
