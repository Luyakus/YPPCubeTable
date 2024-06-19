//
//  LGFeedListHeaderCube.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <Masonry.h>
//#import <YYText.h>
#import <YYWebImage.h>
#import "UIView+Action.h"
#import "LGHeaderCube.h"

@interface LGHeaderCube()
@property (nonatomic, strong) UIImageView *avatarView;
@property (nonatomic, strong) UILabel *nicknameLab;
@property (nonatomic, weak) LGHeaderCubeRenderModel *data;

@end

@implementation LGHeaderCube

- (void)setupView:(UIView *)view {
    [super setupView:view];
    [view addSubview:self.avatarView];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(16);
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.bottom.equalTo(view);
    }];
    
    [view addSubview:self.nicknameLab];
    [self.nicknameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(10);
        make.centerY.equalTo(self.avatarView);
    }];
    
    @weakify(self)
    [self.avatarView setAction:^{
        @strongify(self)
        YPPCellCubeAction *action = [YPPCellCubeAction new];
        action.from = NSStringFromClass(self.class);
        action.type = @"avatarClick";
        action.data = self.data.feedUser.avatar;
        [self.data.passOut sendNext:action];
    }];
}

- (void)fillData:(LGHeaderCubeRenderModel *)data {
    [super fillData:data];
    self.data = data;
    [self.avatarView yy_setImageWithURL:[NSURL URLWithString:data.feedUser.avatar] placeholder:nil];
    self.nicknameLab.text = data.feedUser.nickname;
}

- (CGFloat)cubeHeight {
    return self.data.cubeHeight;
}

- (UIImageView *)avatarView {
    if (_avatarView) return _avatarView;
    _avatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _avatarView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarView.layer.cornerRadius = 16;
    _avatarView.layer.masksToBounds = YES;
    _avatarView.layer.borderWidth = 1 / UIScreen.mainScreen.scale;
    _avatarView.layer.borderColor = UIColor.darkGrayColor.CGColor;
    return _avatarView;
}

- (UILabel *)nicknameLab {
    if (_nicknameLab) return _nicknameLab;
    _nicknameLab = [UILabel new];
    _nicknameLab.font = [UIFont systemFontOfSize:14];
    _nicknameLab.textColor = UIColor.darkGrayColor;
    return _nicknameLab;
}



@end

@implementation LGHeaderCubeRenderModel

- (NSString *)targetCube {
    return NSStringFromClass(LGHeaderCube.class);
}

+ (instancetype)rendModelForData:(LGFeedItemModel *)data {
    if (!data.user) return nil;
    LGHeaderCubeRenderModel *rm = [LGHeaderCubeRenderModel new];
    rm.feedUser = data.user;
    rm.cubeHeight = 42;
    return rm;
}




@end
