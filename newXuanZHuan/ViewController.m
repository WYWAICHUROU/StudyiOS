//
//  ViewController.m
//  newXuanZHuan
//
//  Created by 闻飞 on 2018/7/23.
//  Copyright © 2018年 WrenchTechnology. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView * showImageView;
@property(assign)int p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   self.p = 0;
    
    self.showImageView = [[UIImageView alloc]initWithFrame:CGRectMake(90,90,150,150)];
    
    [self.view addSubview:self.showImageView];
    
    self.showImageView.layer.cornerRadius = 75;
    
    self.showImageView.layer.masksToBounds = YES;
    
    self.showImageView.image =[UIImage imageNamed:@"1.jpg"];
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    [rotation setToValue:@(M_PI*2)];
    
    [rotation setDuration:5];
    
    [rotation setRepeatCount:MAXFLOAT];
    
    [self.showImageView.layer addAnimation:rotation forKey:@"rotation"];
    
    
    UIButton * showOnebutton = [[UIButton alloc]initWithFrame:CGRectMake(120, 520,40,40)];
    
    [self.view addSubview:showOnebutton];
    
    [showOnebutton addTarget:self action:@selector(ggg) forControlEvents:UIControlEventAllEvents];
    
    showOnebutton.backgroundColor = [UIColor redColor];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)ggg
{
    if (self.p == 0) {

    CFTimeInterval pausedTime = [ self.showImageView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 让CALayer的时间停止走动
    self.showImageView.layer.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
   self.showImageView.layer.timeOffset = pausedTime;
        
       self.p = 1;
    
    }else{
        
        CFTimeInterval pausedTime = self.showImageView.layer.timeOffset;
        // 1. 让CALayer的时间继续行走
       self.showImageView.layer.speed = 1.0;
        // 2. 取消上次记录的停留时刻
       self.showImageView.layer.timeOffset = 0.0;
        // 3. 取消上次设置的时间
       self.showImageView.layer.beginTime = 0.0;
        // 4. 计算暂停的时间(这里也可以用CACurrentMediaTime()-pausedTime)
        CFTimeInterval timeSincePause = [self.showImageView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
        // 5. 设置相对于父坐标系的开始时间(往后退timeSincePause)
        self.showImageView.layer.beginTime = timeSincePause;
        
        self.p = 0;
        
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
