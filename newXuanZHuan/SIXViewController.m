//
//  SIXViewController.m
//  newXuanZHuan
//
//  Created by 闻飞 on 2018/7/25.
//  Copyright © 2018年 WrenchTechnology. All rights reserved.
//

#import "SIXViewController.h"

@interface SIXViewController ()
@property(nonatomic,strong)UIButton * showOnceButton;
@end
@implementation SIXViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.showOnceButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,150,150)];
    [self.view addSubview:self.showOnceButton];
    self.showOnceButton.backgroundColor = [UIColor blackColor];
    [self.showOnceButton addTarget:self action:@selector(printerPickerControlle) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
-(void)printerPickerControlle
{
//    if ([self.delegate respondsToSelector:@selector(nextGoToOneceThign)])
//    {
//         [self.delegate nextGoToOneceThign];
//
//         [self dismissViewControllerAnimated:YES completion:nil];
//    }//通过委托来实现传递消息来实现分层接耦
    
    if (self.showBlock) {
        
        self.showBlock();
    }
    
    
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
