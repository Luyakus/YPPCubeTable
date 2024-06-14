//
//  YPPCubeCell.h
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/11.
//

#import <UIKit/UIKit.h>
#import "YPPCubeCellLayout.h"
#import "YPPCellGroupCube.h"
#import "YPPCubeCellViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YPPCubeTableViewCell : UITableViewCell
@property (nonatomic, readonly) YPPCellGroupCube *groupCube;
+ (__kindof YPPCubeTableViewCell *)dequeForTableView:(UITableView *)tableView withLayout:(YPPCubeCellLayout *)layout;
- (void)bindViewModel:(YPPCubeCellViewModel *)model;
@end

NS_ASSUME_NONNULL_END
