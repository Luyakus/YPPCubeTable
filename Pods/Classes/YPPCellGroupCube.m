//
//  YPPCellGroupCube.m
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/14.
//

#import "YPPCellGroupCube.h"
@interface YPPCellGroupCube()

@end
@implementation YPPCellGroupCube
- (instancetype)initWithData:(id)data {
    if (self = [super initWithData:data]) {
        [self setupCubes:data];
    }
    return self;
}

- (void)setupCubes:(NSArray <NSString *> *)cubeClses {
    NSMutableArray *cubes = @[].mutableCopy;
    for (int i = 0; i < cubeClses.count; i ++) {
        YPPCube *cube =  [(YPPCube *)[NSClassFromString(cubeClses[i]) alloc] initWithData:nil];
        [cubes addObject:cube];
    }
    self.cubes = cubes.copy;
}

- (void)setupView:(UIView *)view {
    [super setupView:view];
    [self reload];
}
@end
