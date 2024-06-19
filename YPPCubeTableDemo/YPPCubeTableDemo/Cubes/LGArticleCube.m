//
//  LGArticleCube.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <YYText.h>
#import <Masonry.h>
#import "LGArticleCube.h"
@interface LGArticleCube()
@property (nonatomic, strong) UILabel *articleLab;
@property (nonatomic, weak) LGArticleCubeRenderModel *data;

@end

@implementation LGArticleCube
- (void)setupView:(UIView *)view {
    [super setupView:view];
    [view addSubview:self.articleLab];
    [self.articleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(16);
        make.right.equalTo(view).offset(-16);
        make.top.equalTo(view).offset(10);
    }];
}

- (void)fillData:(LGArticleCubeRenderModel *)data {
    [super fillData:data];
    self.data = data;
    self.articleLab.attributedText = data.article;
}

- (CGFloat)cubeHeight {
    return self.data.cubeHeight;
}

- (UILabel *)articleLab {
    if (_articleLab) return _articleLab;
    _articleLab = [UILabel new];
    _articleLab.numberOfLines = 0;
    return _articleLab;
}

@end

@implementation LGArticleCubeRenderModel

- (NSString *)targetCube {
    return NSStringFromClass(LGArticleCube.class);
}

+ (instancetype)rendModelForData:(LGFeedItemModel *)data {
    if (data.article.length <= 0) return nil;
    LGArticleCubeRenderModel *rm = [LGArticleCubeRenderModel new];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:data.article];
    attr.yy_font = [UIFont systemFontOfSize:14];
    attr.yy_color = UIColor.blackColor;
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 32, CGFLOAT_MAX) text:attr];
    
    rm.article = attr;
    rm.cubeHeight = layout.textBoundingSize.height + 10;
    return rm;
}

@end
