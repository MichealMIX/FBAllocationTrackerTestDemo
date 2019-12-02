//
//  main.m
//  TrackDemo
//
//  Created by 郑锐 on 2019/12/2.
//  Copyright © 2019 郑锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
int main(int argc, char * argv[]) {
    [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
    [[FBAllocationTrackerManager sharedManager] enableGenerations];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
