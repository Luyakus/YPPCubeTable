//
//  LGBottomCube.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import <Masonry.h>
#import "LGBottomCube.h"
@interface LGBottomCube()
@property (nonatomic, weak) LGBottomCubeRenderModel *data;
@property (nonatomic, strong) NSMutableArray <UILabel *> *countLabs;

@end

@implementation LGBottomCube
- (void)setupView:(UIView *)holder {
    [super setupView:holder];
    self.countLabs = @[].mutableCopy;
    UIView *view = [UIView new];
    [holder addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(holder);
        make.top.equalTo(holder).offset(10);
    }];
    
    UIView *loveView = [self createTag:@"🍔" number:0];
    [view addSubview:loveView];
    [loveView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(26);
        make.centerY.equalTo(view);
        make.height.mas_equalTo(40);
    }];
    
    UIView *commentView = [self createTag:@"🌭" number:0];
    [view addSubview:commentView];
    [commentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
        make.height.mas_equalTo(40);
    }];
    
    UIView *collectView = [self createTag:@"🌮" number:0];
    [view addSubview:collectView];
    [collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view).offset(-26);
        make.centerY.equalTo(view);
        make.height.mas_equalTo(40);
    }];
    
//    UIView *line1 = [UIView new];
//    line1.backgroundColor = UIColor.lightGrayColor;
//    [view addSubview:line1];
//    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(view);
//        make.left.equalTo(view).offset(16);
//        make.right.equalTo(view).offset(-16);
//        make.height.mas_equalTo(1/UIScreen.mainScreen.scale);
//    }];
    
    UIView *line2 = [UIView new];
    line2.backgroundColor = UIColor.lightGrayColor;
    [view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(view);
        make.height.mas_equalTo(1/UIScreen.mainScreen.scale);
    }];
}



- (UIView *)createTag:(NSString *)tag number:(NSInteger)number {
    UIView *view = [UIView new];
    UILabel *tagLab = [UILabel new];
    tagLab.text = tag;
    [view addSubview:tagLab];
    [tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view);
        make.centerY.equalTo(view);
        make.size.mas_equalTo(CGSizeMake(25, 15));
    }];
    
    UILabel *numberLab = [UILabel new];
    numberLab.text = [NSString stringWithFormat:@"%@", @(number)];
    numberLab.font = [UIFont systemFontOfSize:12];
    numberLab.textColor = UIColor.darkGrayColor;
    [self.countLabs addObject:numberLab];
    [view addSubview:numberLab];
    [numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view);
        make.left.equalTo(tagLab.mas_right);
        make.centerY.equalTo(view);
    }];
    return view;
}

- (void)fillData:(LGBottomCubeRenderModel *)data {
    [super fillData:data];
    self.data = data;
    self.countLabs[0].text = [NSString stringWithFormat:@"%@", @(data.articleInfo.loveCount)];
    self.countLabs[1].text = [NSString stringWithFormat:@"%@", @(data.articleInfo.commentCount)];
    self.countLabs[2].text = [NSString stringWithFormat:@"%@", @(data.articleInfo.collectCount)];
}

- (CGFloat)cubeHeight {
    return self.data.cubeHeight;
}

@end


@implementation LGBottomCubeRenderModel

- (NSString *)targetCube {
    return NSStringFromClass(LGBottomCube.class);
}

+ (instancetype)rendModelForData:(LGFeedItemModel *)data {
    if (!data.articleInfo) return nil;
    LGBottomCubeRenderModel *rm = [LGBottomCubeRenderModel new];
    rm.articleInfo = data.articleInfo;
    rm.cubeHeight = 60;
    return rm;
}

@end
