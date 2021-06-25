//
//  People.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/4.
//

#import "People.h"

@implementation People

/*
 NSObject的实现应该是直接比较地址
 在Array需要查找某个元素的时候，比如removeObject: indexOfObject:，
 会调用isEqual方法，在调用isEqual方法之前会先判断地址，如果地址不同才会调这个方法
 地址相同则肯定是同一个对象
 
 对于NSDictionary通过key取值的时候，当hash返回相同的时候，会调用isEqual来确认最终是不是同一个对象
 因为可能会有hash冲突，hash一样不能完全证明是同一个对象
 */
- (BOOL)isEqual:(id)other
{
    NSLog(@"self = %p, other = %p", self, other);
    if (other == self) {
        return YES;
    }
    if (![other isKindOfClass:[People class]]) {
        return NO;
    }
    return [self.name isEqualToString:((People *)other).name];
}

/*
 在NSDictionary和NSSet中，查找和添加某个元素，会调用hash方法
 */
- (NSUInteger)hash
{
    return self.name.hash;
}

/*
 在NSDictionary中，添加某个元素，会调用copyWithZone方法
 */
- (id)copyWithZone:(nullable NSZone *)zone
{
    People *p = [[People alloc] init];
    p.name = self.name;
    return p;
}

@end
