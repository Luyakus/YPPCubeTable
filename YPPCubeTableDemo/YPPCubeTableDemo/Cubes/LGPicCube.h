//
//  LGPicCube.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGFeedListModel.h"
#import <YPPCubeTable/YPPCellCubeRenderModel.h>
#import <YPPCube/YPPCube.h>

NS_ASSUME_NONNULL_BEGIN


@interface LGPicCubeRenderModel : YPPCellCubeRenderModel
@property (nonatomic, strong) NSArray <NSString *> *pics;

@end

@interface LGPicCube : YPPCube

@end

NS_ASSUME_NONNULL_END
