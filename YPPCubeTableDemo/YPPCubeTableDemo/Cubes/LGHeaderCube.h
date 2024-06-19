//
//  LGFeedListHeaderCube.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <YPPCubeTable/YPPCellCubeRenderModel.h>
#import "LGFeedListModel.h"
#import <YPPCube/YPPCube.h>

NS_ASSUME_NONNULL_BEGIN


@interface LGHeaderCubeRenderModel : YPPCellCubeRenderModel
@property (nonatomic, strong) LGFeedUserModel *feedUser;

@end

@interface LGHeaderCube : YPPCube

@end

NS_ASSUME_NONNULL_END
