//
//  ViewController.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/3.
//

#import "ViewController.h"
#import "WRLockObject.h"

@interface ViewController ()

@property (nonatomic, strong) WRLockObject *wrLockObject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self p_testWRLock];
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


@end
