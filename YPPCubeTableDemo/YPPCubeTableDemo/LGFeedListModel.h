//
//  LGFeedListModel.h
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGFeedUserModel : NSObject
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *nickname;

@end

@interface LGFeedArticleInfoModel : NSObject
@property (nonatomic, assign) NSInteger loveCount;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, assign) NSInteger collectCount;
@end

@interface LGFeedItemModel : NSObject
@property (nonatomic, strong) LGFeedUserModel *user;
@property (nonatomic, copy) NSString *article;
@property (nonatomic, copy) NSString *hotComment;
@property (nonatomic, strong) NSArray <NSString *> *pics;
@property (nonatomic, copy) NSString *video;
@property (nonatomic, strong) LGFeedArticleInfoModel *articleInfo;


@end

@interface LGFeedDataModel : NSObject
@property (nonatomic, strong) NSArray <LGFeedUserModel *> *users;
@property (nonatomic, strong) NSArray <NSString *> *articles;
@property (nonatomic, strong) NSArray <NSString *> *pics;
@property (nonatomic, strong) NSArray <NSString *> *hotComments;
@property (nonatomic, strong) NSArray <NSString *> *videos;
@property (nonatomic, strong) NSArray <LGFeedArticleInfoModel *> *articleInfos;
@end




NS_ASSUME_NONNULL_END
