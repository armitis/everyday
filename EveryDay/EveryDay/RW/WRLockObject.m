//
//  WRLockObject.m
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/3.
//

#import "WRLockObject.h"
#import <pthread/pthread.h>

@interface WRLockObject ()

@property (nonatomic, copy) NSString *content;

@end

pthread_rwlock_t rwLock;
pthread_rwlockattr_t attr;

@implementation WRLockObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_rwlockattr_init(&attr);
        pthread_rwlock_init(&rwLock, &attr);
    }
    return self;
}

- (NSString *)read
{
    NSLog(@"开始读: %@", self.content);
    pthread_rwlock_rdlock(&rwLock);
    sleep(2);
    pthread_rwlock_unlock(&rwLock);
    NSLog(@"读完了: %@", self.content);
    return self.content;
}

- (void)write:(NSString *)content
{
    NSLog(@"开始写: %@", content);
    pthread_rwlock_wrlock(&rwLock);
    sleep(2);
    self.content = content;
    pthread_rwlock_unlock(&rwLock);
    NSLog(@"写完了: %@", content);
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
