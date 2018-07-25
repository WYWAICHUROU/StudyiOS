//
//  SIXViewController.h
//  newXuanZHuan
//
//  Created by 闻飞 on 2018/7/25.
//  Copyright © 2018年 WrenchTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^sucessFul)(void);
@protocol sendDataWith <NSObject>
@required
-(void)nextGoToOneceThign;
@end
@interface SIXViewController : UIViewController
@property(nonatomic,weak)id<sendDataWith>delegate;//若用这个类型去解决我们的处理代理模式的好处
@property(nonatomic,weak)sucessFul showBlock;
@end
