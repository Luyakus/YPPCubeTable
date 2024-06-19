//
//  LGFeedListCellVM.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGHeaderCube.h"
#import "LGArticleCube.h"
#import "LGPicCube.h"
#import "LGVideoCube.h"
#import "LGHotCommentCube.h"
#import "LGBottomCube.h"
#import "LGFeedListCellVM.h"

@implementation LGFeedListCellVM

- (NSArray<Class> *)cubeRenderModelIndexList {
    return @[
        LGHeaderCubeRenderModel.class,
        LGArticleCubeRenderModel.class,
        LGPicCubeRenderModel.class,
        LGVideoCubeRenderModel.class,
        LGHotCommentCubeRenderModel.class,
        LGBottomCubeRenderModel.class
    ];
}

- (void)responseAction:(YPPCellCubeAction *)action {
    NSLog(@"%@-%@-%@", action.from, action.type, action.data);
}

@end
