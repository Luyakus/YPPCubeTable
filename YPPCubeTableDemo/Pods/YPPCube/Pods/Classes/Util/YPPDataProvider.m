//
//  YPPDataProvider.m
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import "YPPDataProvider.h"

@interface YPPDataProvider ()

@property (nonatomic, strong) NSMapTable *map;

@end

@implementation YPPDataProvider

- (instancetype)init {
    if (self = [super init]) {
        self.map = [NSMapTable mapTableWithKeyOptions:NSMapTableCopyIn valueOptions:NSMapTableWeakMemory];
    }
    return self;
}

- (void)regisitProvider:(id)provider forKey:(NSString *)key {
    if (!provider) return;
    if (![key isKindOfClass:NSString.class]) return;
    [self.map setObject:provider forKey:key];
}

- (id)providerForKey:(NSString *)key {
    if (![key isKindOfClass:NSString.class]) return nil;
    id provider = [self.map objectForKey:key];
    return provider;
}

@end
