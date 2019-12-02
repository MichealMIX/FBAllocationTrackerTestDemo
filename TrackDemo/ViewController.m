//
//  ViewController.m
//  TrackDemo
//
//  Created by 郑锐 on 2019/12/2.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import "ViewController.h"
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self GenerationsFunc];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)GenerationsFunc{
    // Enable generations (if not already enabled in main.m)
    [[FBAllocationTrackerManager sharedManager] enableGenerations];
    
    //此方法可获取所有当前存在的实例
    NSArray<FBAllocationTrackerSummary *> *summaries = [[FBAllocationTrackerManager sharedManager] currentAllocationSummary];
    
    NSLog(@"%@",summaries);
    
    // Object a will be kept in generation with index 0
    NSObject *a = [NSObject new];
    
    
    
    // We are marking new generation
    [[FBAllocationTrackerManager sharedManager] markGeneration];
    
    // Objects b and c will be kept in second generation at index 1
    NSObject *b = [NSObject new];
    NSObject *c = [NSObject new];
    
    [[FBAllocationTrackerManager sharedManager] markGeneration];
    
    // Object d will be kept in third generation at index 2
    NSObject *d = [NSObject new];
    
    NSArray *instances =[[FBAllocationTrackerManager sharedManager] instancesForClass:[NSObject class]
                                                                         inGeneration:1];
    
    NSLog(@"第一代NSObject实例%@",instances);
    
    [[FBAllocationTrackerManager sharedManager] markGeneration];
    
    NSObject *e = [NSObject new];
    
    UIView *f = [UIView new];
    
    NSArray *instances1 =[[FBAllocationTrackerManager sharedManager] instancesForClass:[UIView class]
                                                                         inGeneration:3];
    
    NSLog(@"第三代UIView实例%@",instances1);
}

@end
