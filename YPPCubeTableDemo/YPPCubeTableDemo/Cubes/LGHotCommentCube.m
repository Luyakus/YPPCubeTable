//
//  LGHotCommentCube.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <YYText.h>
#import <Masonry.h>
#import "LGHotCommentCube.h"

@interface LGHotCommentCube()
@property (nonatomic, weak) LGHotCommentCubeRenderModel *data;
@property (nonatomic, strong) UILabel *hotCommentLab;

@end

@implementation LGHotCommentCube
- (void)setupView:(UIView *)view {
    [super setupView:view];
    UIView *holder = [UIView new];
    holder.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.1];
    holder.layer.cornerRadius = 8;
    [view addSubview:holder];
    [holder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view).offset(10);
        make.bottom.equalTo(view);
        make.left.equalTo(view).offset(16);
        make.right.equalTo(view).offset(-16);
    }];
    [holder addSubview:self.hotCommentLab];
    [self.hotCommentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(holder).insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
}

- (void)fillData:(LGHotCommentCubeRenderModel *)data {
    [super fillData:data];
    self.data = data;
    self.hotCommentLab.attributedText = data.hotComment;
}

- (CGFloat)cubeHeight {
    return self.data.cubeHeight;
}


- (UILabel *)hotCommentLab {
    if (_hotCommentLab) return _hotCommentLab;
    _hotCommentLab = [UILabel new];
    return _hotCommentLab;
}
@end


@implementation LGHotCommentCubeRenderModel

- (NSString *)targetCube {
    return NSStringFromClass(LGHotCommentCube.class);
}

+ (instancetype)rendModelForData:(LGFeedItemModel *)data {
    if (data.hotComment.length <= 0) return nil;
    LGHotCommentCubeRenderModel *rm = [LGHotCommentCubeRenderModel new];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"热评♨️: %@", data.hotComment]];
    attr.yy_font = [UIFont systemFontOfSize:14];
    attr.yy_color = UIColor.blackColor;
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 32 - 20, CGFLOAT_MAX) text:attr];
    rm.hotComment = attr;
    rm.cubeHeight = layout.textBoundingSize.height + 10;
    rm.cubeHeight = 50;
    return rm;
}


@end
