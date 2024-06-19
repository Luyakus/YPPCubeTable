//
//  LGFeedListVM.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <YYModel.h>
#import "LGFeedListModel.h"
#import "LGFeedListVM.h"

@implementation LGFeedListVM
- (instancetype)init {
    if (self = [super init]) {
        NSString *path = [NSBundle.mainBundle pathForResource:@"feeds" ofType:@"json"];
        NSError *error = nil;
        NSStringEncoding usedEncode = 0;
        NSString *jsonStr = [NSString stringWithContentsOfFile:path usedEncoding:&usedEncode error:&error];
        self.cvms = [self generateCellVMs:jsonStr];
    }
    return self;
}

- (NSArray <LGFeedListCellVM *> *)generateCellVMs:(NSString *)jsonStr {
    LGFeedDataModel *m = [LGFeedDataModel yy_modelWithJSON:jsonStr];
    NSMutableArray *arr = @[].mutableCopy;
    for (NSInteger i = 0; i < 500; i ++) {
        LGFeedItemModel *obj = [[LGFeedItemModel alloc] init];
        obj.user = [self arrayRandomItem:m.users];
        
        if (arc4random() % 2) {
            obj.article = [self arrayRandomItem:m.articles];
        }
        if (arc4random() % 2) {
            obj.pics = [m.pics subarrayWithRange:NSMakeRange(0, arc4random() % m.pics.count)];
        }
        if (arc4random() % 2) {
            obj.video = [self arrayRandomItem:m.videos];
        }
        if (arc4random() % 2) {
            obj.hotComment = [self arrayRandomItem:m.hotComments];
        }
        
        obj.articleInfo = [self arrayRandomItem:m.articleInfos];
        LGFeedListCellVM *cvm = [[LGFeedListCellVM alloc] initWithData:obj];
        [arr addObject:cvm];
    }
    return arr.copy;
}

- (id)arrayRandomItem:(NSArray *)sourceArray {
    return sourceArray[arc4random() % sourceArray.count];
}
@end
