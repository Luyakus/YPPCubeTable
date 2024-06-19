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
    LGFeedListModel *m = [LGFeedListModel yy_modelWithJSON:jsonStr];
    NSMutableArray *arr = @[].mutableCopy;
    for (NSInteger i = 0; i < 100; i ++) {
        LGFeedItemModel *obj = m.list[i%m.list.count];
        LGFeedListCellVM *cvm = [[LGFeedListCellVM alloc] initWithData:obj];
        [arr addObject:cvm];
    }
    return arr.copy;
}
@end
