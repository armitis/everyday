//
//  ViewController.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/3.
//

#import "ViewController.h"
#import "WRLockObject.h"
#import "People.h"

@interface ViewController ()

@property (nonatomic, strong) WRLockObject *wrLockObject;
@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) NSMutableSet *set;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self p_testWRLock];
//    [self p_testArray];
//    [self p_testEqual];
    
//    [self p_testDictonary];
    [self p_testNSSet];
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

- (void)p_testWRLock
{
    [self wrLockObject];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.wrLockObject read];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.wrLockObject read];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.wrLockObject write:@"abc"];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.wrLockObject read];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.wrLockObject write:@"def"];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.wrLockObject read];
    });
}

- (WRLockObject *)wrLockObject
{
    if (!_wrLockObject) {
        _wrLockObject = [[WRLockObject alloc] init];
    }
    return _wrLockObject;
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
