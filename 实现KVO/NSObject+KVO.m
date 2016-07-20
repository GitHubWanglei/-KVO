//
//  NSObject+KVO.m
//  实现KVO
//
//  Created by lihongfeng on 16/7/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>
#import "KVO_Person.h"

@implementation NSObject (KVO)

- (void)kvo_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    //给KVO_Person动态添加observer属性, 保存observer
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //修改 isa 指针, 指向KVO_Person
    object_setClass(self, [KVO_Person class]);
    
}

@end
