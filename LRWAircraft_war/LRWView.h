//
//  LRWView.h
//  LRWAircraft_war
//
//  Created by rwli on 16/10/20.
//  Copyright © 2016年 rwli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRWSprite.h"

@interface LRWView : UIView


@property (strong,nonatomic)NSMutableArray *bulletArry, *enemyArry, *baArry;
@property (strong,nonatomic)LRWSprite* hero;
@end
