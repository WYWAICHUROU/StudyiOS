//
//  FourViewController.m
//  newXuanZHuan
//
//  Created by 闻飞 on 2018/7/24.
//  Copyright © 2018年 WrenchTechnology. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()
@property(nonatomic,strong)UIView * oneView;

@property(nonatomic,strong)UIView * oneView1;

@property(nonatomic,strong)UIButton *showThreeButton;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
       self.view.backgroundColor = [UIColor whiteColor];
    
    self.showThreeButton = [[UIButton alloc]initWithFrame:CGRectMake(0,650,40,50)];
    
    [self.view addSubview:self.showThreeButton];
    
    
    self.showThreeButton.backgroundColor = [UIColor blackColor];
    
    [self.showThreeButton addTarget:self action:@selector(wwwww) forControlEvents:UIControlEventTouchUpInside];
    

    // Do any additional setup after loading the view.
}

-(void)wwwww
{
    
    self.oneView1 = [[UIView alloc]initWithFrame:CGRectMake(0,150,self.view.bounds.size.width,50)];
    [self.view addSubview:self.oneView1];
    self.oneView1.backgroundColor = [UIColor redColor];
    
    
    self.oneView = [[UIView alloc]initWithFrame:CGRectMake(0,0,self.view.bounds.size.width,200)];
    [self.view addSubview:self.oneView];
    self.oneView.backgroundColor = [UIColor purpleColor];
    
    [UIView animateWithDuration:1.5f animations:^{
        
        
        self.oneView1.frame = CGRectMake(0,200,self.view.bounds.size.width,50);
        
        
        
    } completion:^(BOOL finished) {
        
        
        
        
        [UIView animateWithDuration:1.5f animations:^{
            
            
            self.oneView1.frame = CGRectMake(0,150,self.view.bounds.size.width,50);
            
            
            
        } completion:^(BOOL finished) {
            
            
            self.oneView1.hidden = YES;
            
            
        }];
        
        
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
