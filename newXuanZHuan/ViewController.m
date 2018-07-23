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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,350,350)];
    
    [self.view addSubview:self.showImageView];
    
    self.showImageView.layer.cornerRadius = 175;
    
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
    
    
    self.showImageView.layer.speed = 0;
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
