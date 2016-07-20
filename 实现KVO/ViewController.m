//
//  ViewController.m
//  实现KVO
//
//  Created by lihongfeng on 16/7/20.
//  Copyright © 2016年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"

@interface ViewController ()

@property (nonatomic, strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     KVO 原理:
     1.调用 NSObject 的分类方法, 在方法内部保存监听者Observer, 并修改当前对象的 isa 指针, 使其指向当前类的子类
     2.在子类中重写监听属性的 setter 方法, 在方法内部调用父类的 setter 方法, 使父类的 setter 方法不受影响.
     3.属性发生改变时, 调用子类的 setter 方法.
     4.在子类的 setter 方法中获取监听者Observer, 并执行回调方法.
     */
    
    self.p = [[Person alloc] init];
    [self.p kvo_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"name: %@", self.p.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int i = 0;
    i++;
    self.p.name = [NSString stringWithFormat:@"%d", i];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
