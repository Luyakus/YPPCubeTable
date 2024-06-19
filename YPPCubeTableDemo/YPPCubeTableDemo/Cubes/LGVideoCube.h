//
//  LGVideoCube.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGFeedListModel.h"
#import <YPPCubeTable/YPPCellCubeRenderModel.h>
#import <YPPCube/YPPCube.h>

NS_ASSUME_NONNULL_BEGIN


@interface LGVideoCubeRenderModel : YPPCellCubeRenderModel
@property (nonatomic, copy) NSString *video;

@end

@interface LGVideoCube : YPPCube

@end

NS_ASSUME_NONNULL_END
