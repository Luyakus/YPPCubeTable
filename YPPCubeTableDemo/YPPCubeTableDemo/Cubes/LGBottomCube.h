//
//  LGBottomCube.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGFeedListModel.h"
#import <YPPCubeTable/YPPCellCubeRenderModel.h>
#import <YPPCube/YPPCube.h>

NS_ASSUME_NONNULL_BEGIN


@interface LGBottomCubeRenderModel : YPPCellCubeRenderModel
@property (nonatomic, strong) LGFeedArticleInfoModel *articleInfo;
@end



@interface LGBottomCube : YPPCube

@end

NS_ASSUME_NONNULL_END
