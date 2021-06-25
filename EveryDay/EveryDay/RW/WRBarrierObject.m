//
//  WRBarrierObject.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/3.
//

#import "WRBarrierObject.h"

@interface WRBarrierObject ()

@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) dispatch_queue_t queue;

@end

@implementation WRBarrierObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = dispatch_queue_create("com.everyday", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (NSString *)read
{
    NSLog(@"开始读: %@", self.content);
    dispatch_sync(self.queue, ^{
        sleep(2);
    });
    
    NSLog(@"读完了: %@", self.content);
    return self.content;
}

- (void)write:(NSString *)content
{
    dispatch_barrier_async(self.queue, ^{
        NSLog(@"开始写: %@", content);
        sleep(2);
        self.content = content;
        NSLog(@"写完了: %@", content);
    });
}

- (void)test {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self read];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self read];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self write:@"abc"];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self read];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self write:@"def"];
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self read];
    });
}

@end
