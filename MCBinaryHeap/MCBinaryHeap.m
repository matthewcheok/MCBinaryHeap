//
//  MCBinaryHeap.m
//  MCBinaryHeap
//
//  Created by Matthew Cheok on 8/5/15.
//  Copyright (c) 2015 matthewcheok. All rights reserved.
//

#import "MCBinaryHeap.h"

static const void *heap_retain(CFAllocatorRef all, const void *ptr) {
	return (const void *)CFRetain((CFTypeRef)ptr);
}

static void heap_release(CFAllocatorRef all, const void *ptr) {
	CFRelease((CFTypeRef)ptr);
}

static CFComparisonResult heap_compare(const void *ptr1, const void *ptr2, void *info) {
    id left = (__bridge id)ptr1;
    id right = (__bridge id)ptr2;
    if ([left conformsToProtocol:@protocol(MCBinaryHeapObject)] &&
        [right conformsToProtocol:@protocol(MCBinaryHeapObject)])
    {
        return (CFComparisonResult)[(id<MCBinaryHeapObject>)left heap_compare:(id<MCBinaryHeapObject>)right];
    } else {
        return (CFComparisonResult)[left compare:right];
    }
}

static void heap_apply(const void *val, void *context) {
	void (^block)(id object) = (__bridge void (^)(__strong id))(context);
	if (block) {
		block((__bridge id)(val));
	}
}

@interface MCBinaryHeap ()

@end

@implementation MCBinaryHeap {
	CFBinaryHeapRef _heap;
}

+ (instancetype)heap {
	return [[self alloc] init];
}

+ (instancetype)heapWithHeap:(MCBinaryHeap *)heap {
	return [[self alloc] initWithHeap:heap];
}

+ (instancetype)heapWithArray:(NSArray *)array {
    return [[self alloc] initWithArray:array];
}

- (instancetype)init {
	self = [super init];
	if (self) {
		CFBinaryHeapCallBacks callbacks;
		callbacks.version = 0;
		callbacks.retain = &heap_retain;
		callbacks.release = &heap_release;
		callbacks.compare = &heap_compare;

		_heap = CFBinaryHeapCreate(kCFAllocatorDefault, 0, &callbacks, NULL);
	}
	return self;
}

- (instancetype)initWithHeap:(MCBinaryHeap *)heap {
	self = [super init];
	if (self) {
		_heap = CFBinaryHeapCreateCopy(kCFAllocatorDefault, 0, heap->_heap);
	}
	return self;
}

- (instancetype)initWithArray:(NSArray *)array {
	self = [self init];
	if (self) {
		for (id object in array) {
            [self addObject:object];
		}
	}
	return self;
}

- (NSUInteger)count {
	return CFBinaryHeapGetCount(_heap);
}

- (NSUInteger)countOfObject:(id)object {
	return CFBinaryHeapGetCountOfValue(_heap, (__bridge const void *)(object));
}

- (BOOL)containsObject:(id)object {
	return CFBinaryHeapContainsValue(_heap, (__bridge const void *)(object));
}

- (id)minimumObject {
	return CFBinaryHeapGetMinimum(_heap);
}

- (id)popMinimumObject {
	id object = [self minimumObject];
	[self removeMinimumObject];
	return object;
}

- (void)addObject:(id)object {
	CFBinaryHeapAddValue(_heap, (__bridge const void *)(object));
}

- (void)removeMinimumObject {
	CFBinaryHeapRemoveMinimumValue(_heap);
}

- (void)removeAllObjects {
	CFBinaryHeapRemoveAllValues(_heap);
}

- (void)enumerateObjectsUsingBlock:(void (^)(id object))block {
	void *context = (__bridge void *)(block);
	CFBinaryHeapApplyFunction(_heap, heap_apply, context);
}

- (void)dealloc {
	CFRelease(_heap);
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
	return [MCBinaryHeap heapWithHeap:self];
}

@end
