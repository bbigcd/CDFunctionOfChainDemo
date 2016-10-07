//
//  CDMainViewController.m
//  CDFunctionOfChainDemo
//
//  Created by chendi on 16/10/7.
//  Copyright © 2016年 chendi. All rights reserved.
//

#import "CDMainViewController.h"

/*
 * 仿Masonry的链式函数编程的加法实现
 */
// --- 链式函数实现部分 ----
@interface CDCaculatorMaker : NSObject
@property (nonatomic, assign) int result;
// 加法方法
- (CDCaculatorMaker *(^)(int))add;
// 计算工厂方法
+ (int)makeCaculators:(void (^)(CDCaculatorMaker *make))block;
@end

// 数字为调用方法顺序 add方法调用多少次就执行多少次
@implementation CDCaculatorMaker
- (CDCaculatorMaker *(^)(int))add{
    NSLog(@"4---%@", NSStringFromSelector(_cmd));
    return ^CDCaculatorMaker *(int value){
        NSLog(@"5---%@", NSStringFromSelector(_cmd));
        _result += value;
        return self;
    };
}
+ (int)makeCaculators:(void (^)(CDCaculatorMaker *make))block{
    NSLog(@"2---%@", NSStringFromSelector(_cmd));
    // 创建计算管理者
    CDCaculatorMaker *manager = [[CDCaculatorMaker alloc] init];
    block(manager);
    return manager.result;
}
@end

// ---- 调用部分 ----
@implementation CDMainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1---%@", NSStringFromSelector(_cmd));
    int result = [CDCaculatorMaker makeCaculators:^(CDCaculatorMaker *make) {
        NSLog(@"3---%@", NSStringFromSelector(_cmd));
        make.add(1).add(2).add(4);
        make.add(3).add(5);
    }];
    NSLog(@"6---%@", NSStringFromSelector(_cmd));
    NSLog(@"7---%d", result);
}
@end
