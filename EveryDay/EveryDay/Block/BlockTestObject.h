//
//  BlockTestObject.h
//  EveryDay
//
//  Created by zhengzhiwen on 2021/9/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BlockTestObject : NSObject

@property (nonatomic, copy) void (^a)();
@property (nonatomic, copy) void (^b)();
@property (nonatomic, copy) NSString *data;

- (void)normal;
- (void)nestedBlock;

@end

NS_ASSUME_NONNULL_END
