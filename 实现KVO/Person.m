//
//  Person.m
//  实现KVO
//
//  Created by lihongfeng on 16/7/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setName:(NSString *)name{
    _name = name;
    NSLog(@"------Person: setter.");
}

@end
