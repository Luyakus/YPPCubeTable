//
//  YPPCellCubeRenderModel.m
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/15.
//
#import "YPPCube.h"
#import "YPPCellCubeRenderModel.h"
@interface YPPCellCubeRenderModel()
@property (nonatomic, strong) RACSubject *passOut;

@end
@implementation YPPCellCubeRenderModel
- (instancetype)init {
    if (self = [super init]) {
        self.passOut = [RACSubject subject];
        self.cubeHeight = 0;
    }
    return self;
}

+ (instancetype)rendModelForData:(id)data {
    return nil;
}

- (NSString *)targetCube {
    return NSStringFromClass(YPPCube.class);
}



@end
