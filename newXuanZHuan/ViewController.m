//
//  ViewController.m
//  newXuanZHuan
//
//  Created by 闻飞 on 2018/7/23.
//  Copyright © 2018年 WrenchTechnology. All rights reserved.
//

#import "ViewController.h"
#import "twoViewController.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView * showImageView;
@property(assign)int p;
@property(nonatomic,strong)UIScrollView * showScroolerView;
@property(nonatomic,strong)UIButton * showThreeButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self scroolerViewSunZhuan];
    
    self.showThreeButton = [[UIButton alloc]initWithFrame:CGRectMake(0,550,40,50)];
    
    [self.view addSubview:self.showThreeButton];
    
    
    self.showThreeButton.backgroundColor = [UIColor blackColor];
    
    [self.showThreeButton addTarget:self action:@selector(wwwww) forControlEvents:UIControlEventTouchUpInside];
    
    
    
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


-(void)wwwww
{

    twoViewController * twoView = [[twoViewController alloc]init];
    

    [self presentViewController:twoView animated:YES completion:nil];

}

-(void)scroolerViewSunZhuan
{
//    self.showScroolerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,250,self.view.bounds.size.width,60)];
//    [self.view addSubview:self.showScroolerView];
    
    //方法如下所示 在开发过程中 如图片 1 2 3 如果要对其进行无限循环操作去满足我们的开发需求这个时候我们需要去进行我们的操作去满足我们的开发需求如下所示模式如下 3 1 2 3 1就是这去进行我们的操作需求 这个时候我们需要去进行我们的操作方式如下 )setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;在这个时候我们需要去完成我们的需要完成后这个时候我们需要去完成我们的需要 scrollViewDidEndDecelerating:(UIScrollView *)_scrollView 就是这个时候去满足我们的开发需求DidEndDecelerating减速的时候去完成需求
    
//    - (void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
//    {
//        if (currentPageIndex==0) {
//
//            [_scrollView setContentOffset:CGPointMake(([imageArray count]-2)*viewSize.size.width, 0)];
//        }
//        if (currentPageIndex==([imageArray count]-1)) {
//
//            [_scrollView setContentOffset:CGPointMake(viewSize.size.width, 0)];
//
//        }
//
//    }
    
    twoViewController * twoView = [[twoViewController alloc]init];
    
    [self presentViewController:twoView animated:YES completion:NO];
    
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
