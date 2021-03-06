//
//  WRBarrierObject.h
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WRBarrierObject : NSObject

- (NSString *)read;
- (void)write:(NSString *)content;

- (void)test;

@end

NS_ASSUME_NONNULL_END
