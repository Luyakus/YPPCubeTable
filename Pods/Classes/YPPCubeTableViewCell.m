//
//  YPPCubeCell.m
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/11.
//
#import "YPPCube+Private.h"
#import "YPPCubeTableViewCell.h"



@interface YPPCubeTableViewCell()
@property (nonatomic, strong) YPPCellGroupCube *groupCube;
@property (nonatomic, strong) YPPCubeCellLayout *layout;

@end

@implementation YPPCubeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.layout = [YPPCubeCellLayout layoutForIdentifier:reuseIdentifier];
        self.groupCube = [[YPPCellGroupCube alloc] initWithData:self.layout.cubes];
        [self.groupCube setupView:self.contentView];
    }
    return self;
}

- (void)bindViewModel:(YPPCubeCellViewModel *)model {
    [self.groupCube.cubes enumerateObjectsUsingBlock:^(YPPCube * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj fillData:[model dataForTargetCube:NSStringFromClass(obj.class)]];
        [obj reload];
    }];
}

+ (__kindof YPPCubeTableViewCell *)dequeForTableView:(UITableView *)tableView withLayout:(YPPCubeCellLayout *)layout {
    YPPCubeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:layout.identifier];
    if (!cell) {
        YPPCubeCellLayout *cacheLayout = nil;
        for (YPPCubeCellLayout *regisitedLayout in tableView.regisitedLayouts) {
            if (regisitedLayout.cubes.count - layout.cubes.count > 2) continue;
            if (![regisitedLayout coverOtherLayout:layout]) continue;
            cacheLayout = regisitedLayout;
            break;
        }
        if (!cacheLayout) {
            [tableView registerClass:self.class forCellReuseIdentifier:layout.identifier];
            [tableView.regisitedLayouts addObject:layout];
            [tableView.regisitedLayouts sortUsingComparator:^NSComparisonResult(YPPCubeCellLayout *obj1, YPPCubeCellLayout *obj2) {
                return obj1.cubes.count - obj2.cubes.count;
            }];
            cacheLayout = layout;
            NSLog(@"%@", layout.identifier);
        }
        cell = [tableView dequeueReusableCellWithIdentifier:cacheLayout.identifier];
    }
    return cell;
}


@end
