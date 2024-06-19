//
//  YPPEventHandle.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPEventHandle.h"

@implementation YPPEventHandle

+ (__kindof YPPEventHandle *)handle:(void(^)(__kindof YPPEventHandle *))config {
    YPPEventHandle *handle = [[self alloc] init];
    if (config) {
        config(handle);
    }
    return handle;
}

@end
