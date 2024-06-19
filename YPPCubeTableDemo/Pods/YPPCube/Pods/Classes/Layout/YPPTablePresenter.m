//
//  YPPTablePresenter.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPTablePresenter.h"
#import "Masonry.h"
#import "YPPCubeConst.h"
#import "YPPVLayoutView.h"

@interface YPPPresenterCell : UITableViewCell

@end

@implementation YPPPresenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

@end

@interface YPPTablePresenter () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation YPPTablePresenter

- (instancetype)init {
    if (self = [super init]) {
        self.view = [[UIView alloc] init];
        [self setupView];
    }
    return self;
}

#pragma mark - method
- (void)reload {
    if (!self.tableView.window) return;
    if (!self.delegate || ![self.delegate conformsToProtocol:@protocol(YPPPresenterProtocol)]) return;
    NSInteger count = [self.delegate elementCount];
    for (int i = 0; i < count; i ++) {
        [self.tableView registerClass:YPPPresenterCell.class forCellReuseIdentifier:[NSString stringWithFormat:@"cell-%@", @(i)]];
    }
    [self.tableView reloadData];
}

- (void)reloadIndex:(NSInteger)index {
    if (!self.tableView.window) return;
    if (!self.delegate || ![self.delegate conformsToProtocol:@protocol(YPPPresenterProtocol)]) return;
    NSInteger count = [self.delegate elementCount];
    if (index < count) {
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.delegate elementCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YPPPresenterCell *cell = [tableView dequeueReusableCellWithIdentifier:[NSString stringWithFormat:@"cell-%@", @(indexPath.row)]];
    if (!cell) {
        cell = [[YPPPresenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"cell-%@", @(indexPath.row)]];
    }
    [self.delegate elementAtIndex:indexPath.row presentHolder:cell.contentView];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = [self.delegate elementSizeAtIndex:indexPath.row].height;
    if (YPPViewIsFlex(height)) {
        return UITableViewAutomaticDimension;
    } else {
        return height;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (![self.delegate respondsToSelector:@selector(elementWillAppearAtIndex: presentHolder:)]) return;
    if (![self.delegate respondsToSelector:@selector(elementDidAppearAtIndex: presentHolder:)]) return;
    [self.delegate elementWillAppearAtIndex:indexPath.row presentHolder:cell.contentView];
    [self.delegate elementDidAppearAtIndex:indexPath.row presentHolder:cell.contentView];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (![self.delegate respondsToSelector:@selector(elementDidDisappearAtIndex: presentHolder:)]) return;
    [self.delegate elementDidDisappearAtIndex:indexPath.row presentHolder:cell.contentView];
}

#pragma mark - 准备工作
- (void)setupView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}

- (UITableView *)tableView {
    if (_tableView) return _tableView;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = UIColor.clearColor;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    _tableView = tableView;
    return _tableView;
}

- (UIScrollView *)scrollView {
    return self.tableView;
}

- (UIView *)holder {
    return self.view;
}

@end
