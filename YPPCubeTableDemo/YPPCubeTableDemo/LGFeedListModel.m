//
//  LGFeedListModel.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <YYModel.h>
#import "LGFeedListModel.h"

@implementation LGFeedDataModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"users": LGFeedUserModel.class,
        @"articleInfos": LGFeedArticleInfoModel.class
    };
}
@end


@implementation LGFeedItemModel

@end

@implementation LGFeedArticleInfoModel
@end


@implementation LGFeedUserModel
@end
