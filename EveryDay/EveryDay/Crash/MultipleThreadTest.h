//
//  MultipleThreadTest.h
//  EveryDay
//
//  Created by zhengzhiwen on 2021/9/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MultipleThreadTest : NSObject

@property (nonatomic, strong) NSObject *data;

- (NSObject *)start;
- (void)testIt;

@end

NS_ASSUME_NONNULL_END
