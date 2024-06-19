//
//  LGFeedListController.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGFeedListVM.h"
#import "LGFeedListController.h"
#import <Masonry.h>
#import <YPPCubeTable/YPPCubeTableViewCell.h>

@interface LGFeedListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tb;
@property (nonatomic, strong) LGFeedListVM *vm;

@end

@implementation LGFeedListController


- (instancetype)init {
    if (self = [super init]) {
        self.vm = [[LGFeedListVM alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = NO;
    self.title = @"ZELDA";
    self.navigationController.navigationBar.titleTextAttributes = @{
        NSFontAttributeName: [UIFont italicSystemFontOfSize:19]
    };
    self.view.backgroundColor = UIColor.redColor;
    [self.view addSubview:self.tb];
    [self.tb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    [self.tb reloadData];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.vm.cvms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGFeedListCellVM *cvm = self.vm.cvms[indexPath.row];
    YPPCubeTableViewCell *cell = [YPPCubeTableViewCell dequeForTableView:tableView withLayout:cvm.layout];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell bindViewModel:cvm];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LGFeedListCellVM *cvm = self.vm.cvms[indexPath.row];
    return cvm.cellHeight;
}

- (UITableView *)tb {
    if (_tb) return _tb;
    _tb = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tb.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tb.delegate = self;
    _tb.dataSource = self;
    return _tb;
}

@end
