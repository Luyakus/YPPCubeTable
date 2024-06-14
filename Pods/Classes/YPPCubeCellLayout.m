//
//  YPPCubeCellLayout.m
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/11.
//
#import <objc/runtime.h>
#import "YPPCubeCellLayout.h"

@interface YPPCubeCellLayout()
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, strong) NSDictionary *cubeMap;

@end

@implementation YPPCubeCellLayout
+ (instancetype)layoutForIdentifier:(NSString *)layoutIdentifier {
    YPPCubeCellLayout *layout = [[YPPCubeCellLayout alloc] init];
    layout.identifier = layoutIdentifier;
    layout.cubes = [layoutIdentifier componentsSeparatedByString:@"-"];
    return layout;
}

- (BOOL)coverOtherLayout:(YPPCubeCellLayout *)layout {
    if (self.cubes.count < layout.cubes.count) return NO;
    for (int i = 0; i < layout.cubes.count; i ++) {
        NSString *cube = layout.cubes[i];
        if (!self.cubeMap[cube]) return NO;
        NSInteger index = [[self.cubeMap objectForKey:cube] integerValue];
        if (index < i) return NO;
    }
    return YES;
}

- (NSString *)identifier {
    if (_identifier) return _identifier;
    _identifier = [[self.cubes componentsJoinedByString:@"-"] copy];
    return _identifier;
}

- (NSDictionary *)cubeMap {
    if (_cubeMap) return _cubeMap;
    NSMutableDictionary *dic = @{}.mutableCopy;
    for (int i = 0; i < self.cubes.count; i ++) {
        NSString *cube = self.cubes[i];
        dic[cube] = @(i);
    }
    _cubeMap = dic.copy;
    return _cubeMap;
}

@end

@implementation UITableView(Layout)

static int YPPCubeCellLayoutKey = 0;

- (NSMutableArray<YPPCubeCellLayout *> *)regisitedLayouts {
    NSMutableArray *layouts = objc_getAssociatedObject(self, &YPPCubeCellLayoutKey);
    if (!layouts) {
        layouts = @[].mutableCopy;
        self.regisitedLayouts = layouts;
    }
    return layouts;
}

- (void)setRegisitedLayouts:(NSMutableArray<YPPCubeCellLayout *> *)regisitedLayouts {
    objc_setAssociatedObject(self, &YPPCubeCellLayoutKey, regisitedLayouts, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
