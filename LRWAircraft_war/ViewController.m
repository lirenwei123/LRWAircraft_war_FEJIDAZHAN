//
//  ViewController.m
//  LRWAircraft_war
//
//  Created by rwli on 16/10/20.
//  Copyright © 2016年 rwli. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view1 =[[LRWView alloc]init];
    self.view =view1;

   
    [self gameStart];
    
    
    
}

-(void)gameStart{
        
    
    timer =[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(creat) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    
    
}

-(void)creat{
    [self creatspriteWithimg:[UIImage imageNamed:@"bullet"] andtimesnumber:1 inarry:view1.bulletArry withpoint:CGPointMake(view1.hero.x+view1.hero.img.size.width/2, view1.hero.y) withfuhao:'-'];
   
    [self creatspriteWithimg:[UIImage imageNamed:@"enemy"] andtimesnumber:1 inarry:view1.enemyArry  withpoint:CGPointMake(arc4random_uniform(415), 20) withfuhao:'+'];
   
    for (LRWSprite *sp2 in view1.bulletArry) {
        
        
        for (LRWSprite *sp1 in view1.enemyArry) {
            CGRect rect2 =CGRectMake(sp2.x,sp2.y,sp2.img.size.width,sp2.img.size.height);
           CGRect rect1 =CGRectMake(sp1.x,sp1.y,sp1.img.size.width,sp1.img.size.height);
            CGRect rect3 =CGRectMake(view1.hero.x, view1.hero.y, view1.hero.img.size.width, view1.hero.img.size.height);

                       if (CGRectIntersectsRect(rect1, rect2)) {
                sp1.isused =NO;
                sp2.isused =NO;
                
                LRWSprite *zd =[[LRWSprite alloc]init];
                zd.img =[[UIImage imageNamed:@"bz"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                zd.x =sp1.x;zd.y=sp1.y;
                zd.isused =YES;
                [view1.baArry addObject:zd];
                           
                           if (CGRectIntersectsRect(rect2, rect3)) {
                               UILabel *lab =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
                               lab.center =self.view.center;
                               lab.backgroundColor =[UIColor redColor];
                               lab.text =@"game over,contitue";
                               
                               [self.view addSubview:lab];
                               timer.fireDate =[NSDate distantFuture];
                               UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(goon:)];
                               lab.userInteractionEnabled =YES;
                               [lab addGestureRecognizer:tap];
                               lab.tag =1;
                               
                               UILabel *lab1 =[[UILabel alloc]initWithFrame:CGRectMake(0,20, 200, 100)];
                               
                               lab1.backgroundColor =[UIColor greenColor];
                               lab1.text =@"restart";
                               
                               [self.view addSubview:lab1];
                               
                               UITapGestureRecognizer *tap1 =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(restart:)];
                               lab1.tag =2;
                               
                               lab1.userInteractionEnabled =YES;
                               [lab1 addGestureRecognizer:tap1];
                               
                           }

                
            }        }
    }
    
}
-(void)goon:(UIGestureRecognizer*)sender{
    UILabel *lab =[self.view viewWithTag:2];
    [lab removeFromSuperview];
    [sender.view removeFromSuperview];
    timer.fireDate =[NSDate distantPast];
    [self.view setNeedsDisplay];
}
-(void)restart:(UIGestureRecognizer*)sender{
    [view1.enemyArry removeAllObjects];
    [view1.bulletArry removeAllObjects];
    UILabel *lab =[self.view viewWithTag:1];
    [lab removeFromSuperview];
    [sender.view removeFromSuperview];
    timer.fireDate =[NSDate distantPast];
    [self.view setNeedsDisplay];
}
-(void)creatspriteWithimg:(UIImage*)image andtimesnumber:(NSInteger)num inarry:(NSMutableArray*)arry
                withpoint:(CGPoint)point withfuhao:(char)jiajian{
    
      LRWSprite  *sprite =[[LRWSprite alloc]init];
        sprite.img =image;
        sprite.isused =YES;
    sprite.x =point.x;
    sprite.y =point.y;
    
    for (LRWSprite *sp in arry) {
        if (jiajian =='-') {
            sp.y-=40;
            if (sp.y<0) sp.isused =NO;
        }
        else{
            sp.y+=25;
            if (sp.y>self.view.frame.size.height) sp.isused =NO;
        }
    }
    
    
        [arry addObject:sprite];
    
        [self.view setNeedsDisplay];
       
   
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint p =[[touches anyObject] locationInView:self.view];
    view1.hero.x =p.x-view1.hero.img.size.width/2;
    view1.hero.y =p.y;
    [self.view setNeedsDisplay];

}

@end
