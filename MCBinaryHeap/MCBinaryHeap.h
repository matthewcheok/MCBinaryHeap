//
//  MCBinaryHeap.h
//  MCBinaryHeap
//
//  Created by Matthew Cheok on 8/5/15.
//  Copyright (c) 2015 matthewcheok. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MCBinaryHeapObject <NSObject>
- (NSComparisonResult)heap_compare:(id<MCBinaryHeapObject>)otherObject;
@end

@interface MCBinaryHeap : NSObject <NSCopying>

@property (readonly) NSUInteger count;

+ (instancetype)heap;
+ (instancetype)heapWithHeap:(MCBinaryHeap *)heap;
- (instancetype)initWithHeap:(MCBinaryHeap *)heap;

+ (instancetype)heapWithArray:(NSArray *)array;
- (instancetype)initWithArray:(NSArray *)array;

- (NSUInteger)countOfObject:(id)object;
- (BOOL)containsObject:(id)object;

- (id)minimumObject;
- (id)popMinimumObject;

- (void)addObject:(id)object;
- (void)removeMinimumObject;
- (void)removeAllObjects;

- (void)enumerateObjectsUsingBlock:(void (^)(id object))block;

@end
