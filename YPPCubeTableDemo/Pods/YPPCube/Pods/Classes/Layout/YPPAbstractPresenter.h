//
//  YPPAbstractPresenter.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YPPPresenterProtocol <NSObject>

@required

- (void)elementAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder;
- (CGSize)elementSizeAtIndex:(NSInteger)index;
- (NSInteger)elementCount;

@optional

- (void)elementWillAppearAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder;
- (void)elementDidAppearAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder;
- (void)elementDidDisappearAtIndex:(NSInteger)index presentHolder:(UIView *)presentHolder;

@end

@interface YPPAbstractPresenter : NSObject // 不要直接使用此类, 子类化

@property (nonatomic, readonly) UIView *holder;

@property (nonatomic, weak) id <YPPPresenterProtocol> delegate;

- (void)reloadIndex:(NSInteger)index;

- (void)reload;

@end

NS_ASSUME_NONNULL_END
