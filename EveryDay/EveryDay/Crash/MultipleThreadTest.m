//
//  MultipleThreadTest.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/9/7.
//

#import "MultipleThreadTest.h"

@implementation MultipleThreadTest

- (NSObject *)start
{
    @synchronized (self) {
        for (int i = 0; i < 100; i++) {
            self.data = [[NSObject alloc] init];
        }
    }
    return self.data;
}

- (void)testIt
{
    for (int i = 0; i < 50000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSObject *obj = [self start];
            NSLog(@"%@", obj);
        });
        dispatch_async(dispatch_get_main_queue(), ^{
            NSObject *obj = [self start];
            NSLog(@"%@", obj);
        });
    }
}

@end
