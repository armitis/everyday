//
//  ViewController.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/3.
//

#import "ViewController.h"
#import "WRLockObject.h"
#import "ArrayObject.h"
#import "WRBarrierObject.h"
#import "NilBlockParamTest.h"
#import "BlockTestObject.h"
#import "EveryDay-Swift.h"
#import "MultipleThreadTest.h"

@interface ViewController ()

@property (nonatomic, strong) WRLockObject *wrLockObject;
@property (nonatomic, strong) ArrayObject *arrayObject;
@property (nonatomic, strong) WRBarrierObject *barrierObject;
@property (nonatomic, strong) NilBlockParamTest *crashObject;
@property (nonatomic, strong) TestClass *staticMutilpleThreadTest;
@property (nonatomic, strong) MultipleThreadTest *threadTest;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.wrLockObject test];
//    [self.arrayObject test];
//    [self.barrierObject test];
//    [self.crashObject bar];
//    NSLog(@"%@", @([self.crashObject foo2]));
//
//    BlockTestObject *obj = [[BlockTestObject alloc] init];
//    [obj nestedBlock];
    
//    [self testStaticMultipleThread];
    [self.threadTest testIt];
    
}

- (void)testStaticMultipleThread
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 0; i < 50000; i++) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                NSString *t = [TestClass testWithZoneID:@"America/New_York" time:1630930099646 format:@"yyyy-MM-dd HH:mm:ss"];
                NSLog(@"%@", t);
            });
        }
        for (int i = 0; i < 50000; i++) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *t = [TestClass testWithZoneID:@"America/New_York" time:1630930099646 format:@"yyyy-MM-dd HH:mm:ss"];
                NSLog(@"%@", t);
            });
        }
    });
}



- (WRLockObject *)wrLockObject
{
    if (!_wrLockObject) {
        _wrLockObject = [[WRLockObject alloc] init];
    }
    return _wrLockObject;
}

- (ArrayObject *)arrayObject
{
    if (!_arrayObject) {
        _arrayObject = [[ArrayObject alloc] init];
    }
    return _arrayObject;
}

- (WRBarrierObject *)barrierObject
{
    if (!_barrierObject) {
        _barrierObject = [[WRBarrierObject alloc] init];
    }
    return _barrierObject;
}

- (NilBlockParamTest *)crashObject
{
    if (!_crashObject) {
        _crashObject = [[NilBlockParamTest alloc] init];
    }
    return _crashObject;
}

- (TestClass *)staticMutilpleThreadTest
{
    if (!_staticMutilpleThreadTest) {
        _staticMutilpleThreadTest = [[TestClass alloc] init];
    }
    return _staticMutilpleThreadTest;
}

- (MultipleThreadTest *)threadTest
{
    if (!_threadTest) {
        _threadTest = [[MultipleThreadTest alloc] init];
    }
    return _threadTest;
}

@end
