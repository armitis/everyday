//
//  BlockTestObject.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/9/3.
//

#import "BlockTestObject.h"

@implementation BlockTestObject

- (void)dealloc
{
    NSLog(@"BlockTestObject dealloc");
}

- (void)normal
{
    
}


/*
 关于嵌套的block下的使用:
 1.内部嵌套的block 可以使用weakSelf，效果就是弱引用，多线程下可能会有问题
 2.不能直接使用self或者strongSelf，会导致循环引用
 3.可以再内部嵌套的block 内再次声明__strong, 然后使用strongSelf
 4.如果内部嵌套的gcd，处理方式和1，2，3 一样。也是需要注意循环引用的，gcd外面的block会捕获gcd里面的self。
 
 关于block什么时候产生的循环引用: 在block对象创建的时候。需要看block对象什么时候被创建，在运行时决定。
 */
- (void)nestedBlock
{
    self.data = @"data";
    
    __weak __typeof(self) weakSelf = self;
    self.a = ^{
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        strongSelf.b = ^{
//            __strong __typeof(weakSelf) strongSelf = weakSelf;
            NSLog(@"%@", strongSelf.data);
        };
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"%@", self.data);
//        });
    };
    
//    self.a();
//    self.b();
}

@end
