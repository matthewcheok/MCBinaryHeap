//
//  main.m
//  MCBinaryHeapDemo
//
//  Created by Matthew Cheok on 8/5/15.
//  Copyright (c) 2015 matthewcheok. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCBinaryHeap.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        MCBinaryHeap *heap = [MCBinaryHeap heapWithArray:@[@3, @4, @5, @2]];
        [heap addObject:@(1)];
        NSLog(@"heap count %lu", heap.count);
        
        [heap enumerateObjectsUsingBlock: ^(id object) {
            NSLog(@"heap item %@", object);
        }];
        
        MCBinaryHeap *another = [heap copy];
        
        NSLog(@"min object %@", [heap popMinimumObject]);
        NSLog(@"min object %@", [heap popMinimumObject]);
        NSLog(@"min object %@", [heap popMinimumObject]);
        NSLog(@"min object %@", [heap popMinimumObject]);
        NSLog(@"min object %@", [heap popMinimumObject]);
        NSLog(@"min object %@", [heap popMinimumObject]);
        
        [heap enumerateObjectsUsingBlock: ^(id object) {
            NSLog(@"heap item %@", object);
        }];
        
        [another enumerateObjectsUsingBlock: ^(id object) {
            NSLog(@"another item %@", object);
        }];
        
    }
    return 0;
}