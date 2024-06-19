//
//  YPPDataSource.h
//  YPPCube
//
//  Created by DoubleShuai on 2021/8/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YPPDataSourceProtocol <NSObject>

- (void)dataDidChanged:(NSString *)from;

@end

@interface YPPDataSource : NSObject

@property (nonatomic, weak) id <YPPDataSourceProtocol> delegate;

- (void)fetch:(id)data;

- (void)fillData:(id)data;

@end

NS_ASSUME_NONNULL_END
