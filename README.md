MCBinaryHeap ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)
========================

[![Badge w/ Version](https://cocoapod-badges.herokuapp.com/v/MCBinaryHeap/badge.png)](https://github.com/matthewcheok/MCBinaryHeap)
[![Badge w/ Platform](https://cocoapod-badges.herokuapp.com/p/MCBinaryHeap/badge.svg)](https://github.com/matthewcheok/MCBinaryHeap)

An Objective-C wrapper of CFBinaryHeap. Core Foundation priority queue implementation.

## Installation

Add the following to your [CocoaPods](http://cocoapods.org/) Podfile

    pod 'MCBinaryHeap', '~> 0.1'

or clone as a git submodule,

or just copy files in the ```MCBinaryHeap``` folder into your project.

## Using MCBinaryHeap

Objects you add to ```MCBinaryHeap``` must implement ```- (NSComparisonResult)compare:(id)otherObject;```.

The usage is very similar to ```NSMutableArray```.

```
MCBinaryHeap *heap = [MCBinaryHeap heapWithArray:@[@3, @4, @5, @2]];
[heap addObject:@(1)];
NSLog(@"heap count %lu", heap.count);

[heap enumerateObjectsUsingBlock: ^(id object) {
    NSLog(@"heap item %@", object);
}];

NSLog(@"min object %@", [heap popMinimumObject]);
```
See the demo project for more details.

## License

MCBinaryHeap is under the MIT license.
