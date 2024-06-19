//
//  YPPDataProvider.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YPPDataProvider : NSObject

- (void)regisitProvider:(id)provider forKey:(NSString *)key;

- (id)providerForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
