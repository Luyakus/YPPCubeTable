//
//  LGVideoCube.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//

#import <Masonry.h>
#import <YYWebImage.h>
#import "UIView+Action.h"
#import "LGVideoCube.h"

@interface LGVideoCube()
@property (nonatomic, strong) LGVideoCubeRenderModel *data;
@property (nonatomic, strong) UIImageView *videoView;
@end

@implementation LGVideoCube
- (void)setupView:(UIView *)view {
    [super setupView:view];
    [view addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(16);
        make.right.equalTo(view).offset(-16);
        make.top.equalTo(view).offset(10);
        make.bottom.equalTo(view);
    }];
    @weakify(self)
    [self.videoView setAction:^{
        @strongify(self)
        YPPCellCubeAction *action = [YPPCellCubeAction new];
        action.from = NSStringFromClass(self.class);
        action.type = @"videoClick";
        action.data = self.data.video;
        [self.data.passOut sendNext:action];
    }];
}

- (void)fillData:(LGVideoCubeRenderModel *)data {
    [super fillData:data];
    self.data = data;
    [self.videoView yy_setImageWithURL:[NSURL URLWithString:data.video] placeholder:nil];
}

- (CGFloat)cubeHeight {
    return self.data.cubeHeight;
}

- (UIImageView *)videoView {
    if (_videoView) return _videoView;
    _videoView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _videoView.contentMode = UIViewContentModeScaleAspectFill;
    _videoView.layer.cornerRadius = 8;
    _videoView.layer.masksToBounds = YES;
    return _videoView;
}
@end


@implementation LGVideoCubeRenderModel

- (NSString *)targetCube {
    return NSStringFromClass(LGVideoCube.class);
}

+ (instancetype)rendModelForData:(LGFeedItemModel *)data {
    if (data.video.length <= 0) return nil;
    LGVideoCubeRenderModel *rm = [LGVideoCubeRenderModel new];
    rm.video = data.video;
    rm.cubeHeight = 190;
    return rm;
}



@end
