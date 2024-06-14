//
//  YPPCubeCellViewModel.h
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/11.
//

#import <Foundation/Foundation.h>
#import "YPPCubeConst.h"
#import "YPPCellCubeAction.h"
#import "YPPCellCubeRenderModel.h"
#import "YPPCubeCellLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface YPPCubeCellViewModel : NSObject
@property (nonatomic, readonly) id data;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, weak) id table; // UITableView 或 UICollectionView
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, readonly) YPPCubeCellLayout *layout;


- (YPPCellCubeRenderModel *)dataForTargetCube:(NSString *)targetCube;

// overwrite
- (instancetype)initWithData:(id)data;
- (void)updateData:(id)data;
- (NSArray<Class> *)cubeRenderModelIndexList;
- (void)responseAction:(YPPCellCubeAction *)action;
@end

NS_ASSUME_NONNULL_END
