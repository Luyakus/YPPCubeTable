//
//  YPPCube+Private.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPCube.h"
#import "YPPGroupCube.h"
NS_ASSUME_NONNULL_BEGIN

@interface YPPCube (Private)

- (void)callOnload; // if overwrite call super

- (void)callOnAppear; // if overwrite call super

- (void)callOnDisappear; // if overwrite call super

- (void)callOnUnMount; // if overwrite call super

@end

@interface YPPCube ()

@property (nonatomic, copy) void (^reloadAciton)(void);

@property (nonatomic, weak) UIView *superView;
@property (nonatomic, weak) YPPGroupCube *superCube;

@end

NS_ASSUME_NONNULL_END
