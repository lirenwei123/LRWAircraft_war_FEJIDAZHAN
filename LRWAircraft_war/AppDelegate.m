//
//  AppDelegate.m
//  LRWAircraft_war
//
//  Created by rwli on 16/10/20.
//  Copyright © 2016年 rwli. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate


-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController =[[ViewController alloc]init];
    [_window makeKeyAndVisible];
    return YES;
    
}
@end
