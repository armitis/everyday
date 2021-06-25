//
//  ArrayObject.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/18.
//

#import "ArrayObject.h"
#import "People.h"

@implementation ArrayObject


- (void)test {
    [self p_testArray];
//    [self p_testEqual];
//
//    [self p_testDictonary];
//    [self p_testNSSet];
}

- (void)p_testNSSet
{
    People *p = [[People alloc] init];
    p.name = @"1";

    [self.set addObject:p];
    
    NSLog(@"%@", @([self.set containsObject:p]));
}


- (void)p_testDictonary
{
    People *p = [[People alloc] init];
    p.name = @"1";

    [self.dict setObject:@(1) forKey:p];
    
    NSLog(@"%@", self.dict[p]);
}

- (void)p_testEqual
{
    People *p = [[People alloc] init];
    p.name = @"1";
    People *p2 = [[People alloc] init];
    p2.name = @"1";
    
    NSLog(@"%@", @(p == p2));
    NSLog(@"%@", @([p isEqual:p2]));
}

- (void)p_testArray
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    People *p = [[People alloc] init];
    p.name = @"1";
    People *p2 = [[People alloc] init];
    p.name = @"2";
    People *p3 = [[People alloc] init];
    p.name = @"3";
    People *p4 = [[People alloc] init];
    p.name = @"4";
    [array addObject:p];
    [array addObject:p2];
    [array addObject:p3];
    NSLog(@"%@", array);
    
//    [array removeObject:p2];
//    NSLog(@"%@", array);
//
//    [array removeObject:p4];
//    NSLog(@"%@", array);
    
    NSUInteger index = [array indexOfObject:p2];
    NSLog(@"%@", @(index));
}

- (NSMutableDictionary *)dict
{
    if (!_dict) {
        _dict = [NSMutableDictionary dictionary];
    }
    return _dict;
}

- (NSMutableSet *)set
{
    if (!_set) {
        _set = [[NSMutableSet alloc] init];
    }
    return _set;
}

@end
