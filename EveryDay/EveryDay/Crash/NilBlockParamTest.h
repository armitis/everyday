//
//  NilBlockParamTest.h
//  EveryDay
//
//  Created by zhengzhiwen on 2021/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NilBlockParamTest : NSObject

{
    
    NSInteger value;
}

- (void)foo:(void(^)())callback;
- (void)bar;

- (NSInteger)foo2;

@end

NS_ASSUME_NONNULL_END
