//
//  LGArticleCube.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGFeedListModel.h"
#import <YPPCubeTable/YPPCellCubeRenderModel.h>
#import <YPPCube/YPPCube.h>

NS_ASSUME_NONNULL_BEGIN


@interface LGArticleCubeRenderModel : YPPCellCubeRenderModel
@property (nonatomic, copy) NSAttributedString *article;

@end


@interface LGArticleCube : YPPCube

@end

NS_ASSUME_NONNULL_END
