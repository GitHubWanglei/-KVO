//
//  KVO_Person.m
//  实现KVO
//
//  Created by lihongfeng on 16/7/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "KVO_Person.h"
#import <objc/message.h>

@implementation KVO_Person

- (void)setName:(NSString *)name{
    [super setName:name];
    NSLog(@"------KVO_Person: setter.");
    
    //获取 observer 执行回调方法
    id observer = objc_getAssociatedObject(self, @"observer");
    
    [observer observeValueForKeyPath:@"name" ofObject:self change:nil context:nil];
    
}

@end
