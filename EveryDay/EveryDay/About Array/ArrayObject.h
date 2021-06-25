//
//  ArrayObject.h
//  EveryDay
//
//  Created by zhengzhiwen on 2021/6/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ArrayObject : NSObject

@property (nonatomic, strong) NSMutableDictionary *dict;
@property (nonatomic, strong) NSMutableSet *set;

- (void)test;

@end

NS_ASSUME_NONNULL_END
