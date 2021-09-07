//
//  NilBlockParamTest.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/7/15.
//

#import "NilBlockParamTest.h"

@implementation NilBlockParamTest

- (void)foo:(void (^)())callback
{
    if (callback) {
        //如果不判断，当callback为nil，会崩溃
        callback();
    }
}

- (void)bar
{
    [self foo:nil];
}

- (NSInteger)foo2
{
    NilBlockParamTest *t = nil;
    //这里会崩溃
    return t->value;
}

@end
