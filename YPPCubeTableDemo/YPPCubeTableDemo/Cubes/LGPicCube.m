//
//  LGPicCube.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <YYWebImage.h>
#import <Masonry.h>
#import "LGPicCube.h"
#import "UIView+Action.h"


#define KWidth  (UIScreen.mainScreen.bounds.size.width - 32)
#define KSpace  8
#define KColumnCount  3
#define KImageWidth  ((KWidth - KSpace * (KColumnCount - 1)) / KColumnCount)

@interface LGPicCube()
@property (nonatomic, weak) LGPicCubeRenderModel *data;
@property (nonatomic, strong) UIView *holder;
@end

@implementation LGPicCube
- (void)setupView:(UIView *)view {
    [super setupView:view];
    self.holder = [UIView new];
    [view addSubview:self.holder];
    [self.holder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(view).insets(UIEdgeInsetsMake(10, 16, 0, 16));
    }];
}

- (void)fillData:(LGPicCubeRenderModel *)data {
    [super fillData:data];
    self.data = data;
    [self.holder.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [data.pics enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger rowIndex = idx / KColumnCount;
        NSInteger columnIndex = idx % KColumnCount;
        CGRect rect = CGRectMake((KImageWidth + KSpace) * columnIndex, (KImageWidth + KSpace) * rowIndex, KImageWidth, KImageWidth);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
        imageView.layer.cornerRadius = 4;
        imageView.layer.masksToBounds = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.holder addSubview:imageView];
        [imageView yy_setImageWithURL:[NSURL URLWithString:obj] placeholder:nil];
        @weakify(self)
        [imageView setAction:^{
            @strongify(self)
            YPPCellCubeAction *action = [YPPCellCubeAction new];
            action.from = NSStringFromClass(self.class);
            action.type = @"pickClick";
            action.data = @(idx);
            [self.data.passOut sendNext:action];
        }];
    }];
}

- (CGFloat)cubeHeight {
    return self.data.cubeHeight;
}

@end

@implementation LGPicCubeRenderModel

- (NSString *)targetCube {
    return NSStringFromClass(LGPicCube.class);
}

+ (instancetype)rendModelForData:(LGFeedItemModel *)data {
    if (data.pics.count <= 0) return nil;
    LGPicCubeRenderModel *rm = [LGPicCubeRenderModel new];
    NSInteger rowCount = (data.pics.count % KColumnCount == 0 ? 0 : 1) + data.pics.count / KColumnCount;
    rm.cubeHeight = rowCount * KImageWidth + (rowCount - 1) * KSpace + 10;
    rm.pics = data.pics;
    return rm;
}

@end
