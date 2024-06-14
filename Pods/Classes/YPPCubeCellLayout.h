//
//  YPPCubeCellLayout.h
//  YPPCommunity
//
//  Created by DZ0400843 on 2022/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface YPPCubeCellLayout : NSObject

@property (nonatomic, strong) NSArray <NSString *> *cubes;
@property (nonatomic, readonly) NSString *identifier;

- (BOOL)coverOtherLayout:(YPPCubeCellLayout *)layout;
+ (instancetype)layoutForIdentifier:(NSString *)layoutIdentifier;
@end

@interface UITableView(Layout)
@property (nonatomic, strong) NSMutableArray <YPPCubeCellLayout *> *regisitedLayouts;
@end



NS_ASSUME_NONNULL_END
