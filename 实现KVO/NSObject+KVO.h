//
//  NSObject+KVO.h
//  实现KVO
//
//  Created by lihongfeng on 16/7/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)kvo_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
