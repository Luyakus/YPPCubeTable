//
//  YPPCellCubeRenderModel.h
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/15.
//

#import <Foundation/Foundation.h>
#import "YPPCellCubeAction.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
NS_ASSUME_NONNULL_BEGIN

@interface YPPCellCubeRenderModel : NSObject
@property (nonatomic, readonly) RACSubject *passOut;
@property (nonatomic, strong) NSIndexPath *indexPath;


@property (nonatomic, assign) CGFloat cubeHeight; // 计算 cube 高度

// overwrite
+ (instancetype __nullable)rendModelForData:(id)data;
- (NSString *)targetCube;
@end

NS_ASSUME_NONNULL_END
