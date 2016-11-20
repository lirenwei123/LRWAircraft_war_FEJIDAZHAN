//
//  LRWView.m
//  LRWAircraft_war
//
//  Created by rwli on 16/10/20.
//  Copyright © 2016年 rwli. All rights reserved.
//

#import "LRWView.h"


@implementation LRWView
- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self setbackgrounimage];
        self.backgroundColor =[UIColor grayColor];
        
        self.hero =[[LRWSprite alloc]init];
        _hero.img =[UIImage imageNamed:@"hero"];
        _hero.isused =YES;
        self.bulletArry =[NSMutableArray arrayWithCapacity:100];
        self.enemyArry =@[].mutableCopy;
        self.baArry =@[].mutableCopy;

       
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self.hero.img drawAtPoint:CGPointMake(self.hero.x, self.hero.y)];
    [self drawspriteWith:self.bulletArry];
    [self drawspriteWith:self.enemyArry];
    [self drawspriteWith:self.baArry];
    [self.baArry removeAllObjects];
    
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.hero.x =self.frame.size.width/2-self.hero.img.size.width/2;
    self.hero.y =self.frame.size.height-self.hero.img.size.height;

}
-(void)drawspriteWith:(NSMutableArray*)arry{
    NSMutableArray *arry1 =@[].mutableCopy;
    for ( LRWSprite *sprite in arry) {
        if (sprite.isused ==NO) {
            [arry1 addObject:sprite];
        }
    }
    
    [arry removeObjectsInArray:arry1];
    
    for ( LRWSprite *sprite in arry) {
        [sprite.img drawAtPoint:CGPointMake(sprite.x, sprite.y)];
    }
}

-(void)setbackgrounimage{
    UIImageView *imgv =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background"]];
    [self addSubview:imgv];
}

@end
