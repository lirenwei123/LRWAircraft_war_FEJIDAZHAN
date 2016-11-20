//
//  LRWSprite.h
//  LRWAircraft_war
//
//  Created by rwli on 16/10/20.
//  Copyright © 2016年 rwli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LRWSprite : NSObject

@property (assign,nonatomic)  CGFloat x,y;
@property (strong,nonatomic)UIImage *img;
@property (assign,nonatomic)  BOOL  isused;



@end
