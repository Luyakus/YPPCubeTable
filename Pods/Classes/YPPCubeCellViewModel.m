//
//  YPPCubeCellViewModel.m
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/11.
//

#import "YPPCubeCellViewModel.h"
@interface YPPCubeCellViewModel()
@property (nonatomic, strong) id data;
@property (nonatomic, strong) YPPCubeCellLayout *layout;
@property (nonatomic, strong) NSMutableDictionary *rendModelMap;

@end

@implementation YPPCubeCellViewModel
- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
        self.rendModelMap = @{}.mutableCopy;
        self.layout = [[YPPCubeCellLayout alloc] init];
        [self setup];
    }
    return self;
}
- (void)updateData:(id)data {
    self.data = data;
    [self.rendModelMap removeAllObjects];
    self.layout = [[YPPCubeCellLayout alloc] init];
    self.cellHeight = 0;
    [self setup];
}
- (void)setup {
    NSArray *list = [self cubeRenderModelIndexList];
    NSMutableArray *cubes = @[].mutableCopy;
    @weakify(self)
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YPPCellCubeRenderModel *renderModel = [obj performSelector:@selector(rendModelForData:) withObject:self.data];
        if (renderModel) {
            [[renderModel.passOut takeUntil:self.rac_willDeallocSignal]
             subscribeNext:^(YPPCellCubeAction *x) {
                @strongify(self)
                [self responseAction:x];
            }];
            [cubes addObject:renderModel.targetCube];
            [self.rendModelMap setObject:renderModel forKey:renderModel.targetCube];
            // 自适应高度暂时不支持
//            if (YPPViewIsFlex(renderModel.cubeHeight)) {
//                self.cellHeight = YPPViewFlex;
//            } else {
//                if (!YPPViewIsFlex(self.cellHeight)) {
                    self.cellHeight += renderModel.cubeHeight;
//                }
//            }
        }
    }];
    self.layout.cubes = cubes.copy;
}


- (YPPCellCubeRenderModel *)dataForTargetCube:(NSString *)targetCube {
    YPPCellCubeRenderModel *renderModel = [self.rendModelMap objectForKey:targetCube];
    renderModel.indexPath = self.indexPath;
    return renderModel;
}

- (NSArray<Class> *)cubeRenderModelIndexList {
    return @[];
}

- (void)responseAction:(YPPCellCubeAction *)action {
    
}
@end
