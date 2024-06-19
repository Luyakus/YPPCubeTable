//
//  YPPGroupCube.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPCube.h"
#import "YPPAbstractPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface YPPGroupCube : YPPCube <YPPPresenterProtocol>

@property (nonatomic, readonly) YPPAbstractPresenter *presenter;
@property (nonatomic, readonly) UIView *contentView; // 实际添加子 cube 的view

@property (nonatomic, strong) NSMutableArray <YPPCube *> *cubes;

// reload method
- (void)reloadIndex:(NSInteger)index;

- (void)reload;

// overwrite
- (Class)presenterClass;

- (UIEdgeInsets)contentInsets;

@end

// 竖向布局
@interface YPPVGroupCube : YPPGroupCube
@end

// 横向布局
@interface YPPHGroupCube : YPPGroupCube
@end


// 层级布局
@interface YPPZGroupCube : YPPGroupCube
@end

// 滚动布局
@interface YPPGroupScrollCube : YPPGroupCube
@property (nonatomic, readonly) UIScrollView *scrollView;
@end



NS_ASSUME_NONNULL_END
