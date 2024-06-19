//
//  YPPCube+Private.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPCube+Private.h"

@implementation YPPCube (Private)

- (void)callOnload {
    self.status = YPPCubeStatusOnLoad;
    [self onLoad];
}

- (void)callOnAppear {
    self.status = YPPCubeStatusOnAppear;
    [self onAppear];
}

- (void)callOnDisappear {
    self.status = YPPCubeStatusOnDisappear;
    [self onDisappear];
}

- (void)callOnUnMount {
    self.status = YPPCubeStatusOnUnMount;
    [self onUnMount];
}

@end
