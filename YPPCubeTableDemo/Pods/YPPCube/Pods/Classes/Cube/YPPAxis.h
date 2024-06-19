//
//  YPPAxis.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "YPPCube.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, YPPAxisStatus) {
    YPPAxisStatusOnload,
    YPPAxisStatusOnAppear,
    YPPAxisStatusOnDisappear,
};

@interface YPPAxis : NSObject <YPPDataSourceProtocol>

@property (nonatomic, assign) YPPAxisStatus status;
@property (nonatomic, readonly) __kindof YPPDataSource *dataSource;
@property (nonatomic, readonly) NSMutableArray <YPPCube *> *cubes;

// call back
- (void)onLoad NS_REQUIRES_SUPER;

- (void)onAppear NS_REQUIRES_SUPER;

- (void)onDisappear NS_REQUIRES_SUPER;
 
// method
- (void)reload NS_REQUIRES_SUPER;

- (void)callOnload NS_REQUIRES_SUPER;

- (void)callOnAppear NS_REQUIRES_SUPER;

- (void)callOnDisappear NS_REQUIRES_SUPER;
 
// overwrite
- (instancetype)initWithData:(nullable id)data NS_REQUIRES_SUPER;

- (void)setupView:(UIView *)rootview NS_REQUIRES_SUPER; 

- (Class)dataSourceClass;

@end

NS_ASSUME_NONNULL_END
