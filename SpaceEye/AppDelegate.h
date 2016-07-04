//
//  AppDelegate.h
//  SpaceEye
//
//  Created by mac on 12/26/15.
//  Copyright (c) 2015 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class ViewController;
@class SeondViewController;
@class ThirdViewController;


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) ViewController *Root;
@property(strong, nonatomic) SeondViewController *Second;
@property(strong, nonatomic) ThirdViewController *Third;

@property (strong, nonatomic) UINavigationController *firstNavigation;
@property (strong, nonatomic) UINavigationController *secondNavigation;

@end

