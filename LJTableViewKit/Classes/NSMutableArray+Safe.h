//
//  NSMutableArray+Safe.h
//  JXShop
//
//  Created by clj on 2017/10/5.
//  Copyright © 2017年 JX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Safe)

- (id)safeObjectAtIndex:(NSUInteger)index;
- (void)safeRemoveObjectAtIndex:(NSUInteger)index;
- (void)safeRemoveObject:(id)anObject;
- (void)safeRemoveObjectsInRange:(NSRange)range;

- (void)safeAddObject:(id)anObject;
- (void)safeAddObjectsFromArray:(NSArray *)otherArray;
- (void)safeInsertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)length;
@end
