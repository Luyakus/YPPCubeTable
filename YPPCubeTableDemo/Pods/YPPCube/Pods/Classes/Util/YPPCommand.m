//
//  YPPCommand.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPCommand.h"
#import "YPPDataProvider.h"

@implementation YPPCommand

+ (void)excute:(void(^)(__kindof YPPCommand *it))config {
    YPPCommand *commamd = [[self alloc] init];
    if (config) {
        config(commamd);
    }
    [commamd excute];
}

- (void)excute {
    
}

@end
