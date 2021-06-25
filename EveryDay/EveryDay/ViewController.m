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

@interface ViewController ()

@property (nonatomic, strong) WRLockObject *wrLockObject;
@property (nonatomic, strong) ArrayObject *arrayObject;
@property (nonatomic, strong) WRBarrierObject *barrierObject;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.wrLockObject test];
//    [self.arrayObject test];
    [self.barrierObject test];
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


@end
