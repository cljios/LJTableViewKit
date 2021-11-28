//
//  NSMutableArray+Safe.m
//  JXShop
//
//  Created by clj on 2017/10/5.
//  Copyright © 2017年 JX. All rights reserved.
//

#import "NSMutableArray+Safe.h"

@implementation NSMutableArray (Safe)


- (id)safeObjectAtIndex:(NSUInteger)index
{
    if ([self isEqual:[NSNull null]]) {
//        NSLog(@"数组为空！");
        return nil;
    } else if (index >= [self count]) {
//        NSLog(@"数组越界：%lu-%lu",(unsigned long)index,(unsigned long)self.count);
        return nil;
    }
//    NSLog(@" index %ld beyond array bound with %s",index, __FUNCTION__);
    return self[index];
}

- (void)safeAddObject:(id)anObject
{
    if (anObject == nil) {
//        NSLog(@" you can not add an nil object to array with %s", __FUNCTION__);
        return;
    } else {
        [self addObject:anObject];
    }
}


- (void)safeAddObjectsFromArray:(NSArray *)otherArray
{
    if (otherArray != nil) {
        
        [self addObjectsFromArray:otherArray];
        return;
    }
    NSLog(@" can not add an nil to array with %s",__FUNCTION__);
}

- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (!anObject) {
        NSLog(@" can not inset an nil Object to array with %s",__FUNCTION__);
        return;
    }
    [self insertObject:anObject atIndex:index];
}

- (void)safeRemoveObjectAtIndex:(NSUInteger)index{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
        return;
    }
//    NSLog(@"remove index %ld beyond array bound with %s",index, __FUNCTION__);
}

- (void)safeRemoveObject:(id)anObject
{
    if (!anObject) {
//        NSLog(@"remove you can not set an nil object to array %s",__FUNCTION__);
        return;
    } else {
        [self removeObject:anObject];
    }
}

- (void)safeRemoveObjectsInRange:(NSRange)range{
    NSUInteger count = self.count;
    if (count < range.location || count < range.length )
    {
        NSLog(@"removeObjectInRange index  beyond array bound with %s", __FUNCTION__);
        return;
    }
    [self removeObjectsInRange:range];
}

- (void)length
{
    NSLog(@"字典没有%s",__FUNCTION__);
}

@end
