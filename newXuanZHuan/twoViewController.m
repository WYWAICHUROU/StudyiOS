//
//  twoViewController.m
//  newXuanZHuan
//
//  Created by 闻飞 on 2018/7/23.
//  Copyright © 2018年 WrenchTechnology. All rights reserved.
//

#import "twoViewController.h"

@interface twoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableview;
@property(nonatomic,strong)UIImageView * headImv;
@property(nonatomic,strong)UIView * navView;
@property(nonatomic,strong)UILabel * titLab;
@end

@implementation twoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.headImv];
    [self.view addSubview:self.navView];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //拿到偏移量
    CGFloat offsetY = scrollView.contentOffset.y;
    NSInteger headImvH = self.view.bounds.size.width/ 320 * 300 ;
    CGFloat offset = headImvH + offsetY;//计算偏移量
    //设置导航栏
    self.navView.alpha = (offset / 250);
    if (self.navView.alpha >=1) {
        self.navView.alpha = 1;
    }
    //设置标题文字 设置距离
    //alpha 0-->1 y 64-->20
    //设置头部图片大小
    self.headImv.frame = CGRectMake(0, 0, self.view.bounds.size.width, headImvH-offset);
}
-(UIView *)navView
{
    if (!_navView) {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 64)];
        _navView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.8];
        _navView.clipsToBounds = YES;
        _titLab = [[UILabel alloc]init];
        _titLab.bounds = CGRectMake(0, 0, 150, 44);
        _titLab.textAlignment = NSTextAlignmentCenter;
        _titLab.font = [UIFont systemFontOfSize:12];
        _titLab.textColor = [UIColor blueColor];
        _titLab.numberOfLines = 0;
        _titLab.text = @"CF\n明天休息了";
        [_navView addSubview:_titLab];
    }
    return _navView;
}

-(UITableView *)tableview
{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.view.bounds.size.width,self.view.bounds.size.height) style:UITableViewStylePlain];
        CGFloat headImvH = self.view.bounds.size.width/ 320 * 300;
        //这句很重要
        _tableview.contentInset = UIEdgeInsetsMake(headImvH-20, 0, 0, 0);
        _tableview.dataSource = self;
        _tableview.delegate = self;
    }
    return _tableview;
}
-(UIImageView *)headImv
{
    if (!_headImv) {
        _headImv = [[UIImageView alloc]init];
        CGFloat headImvH = self.view.bounds.size.width/ 320 * 300;
        _headImv.frame = CGRectMake(0, 0, self.view.bounds.size.width,self.view.bounds.size.height);
        _headImv.image = [UIImage imageNamed:@"1.jpg"];
        //一定记住模式
        _headImv.contentMode = UIViewContentModeScaleAspectFill;
        _headImv.clipsToBounds = YES;
    }
    return _headImv;
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据——%td",indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"测试数据——%td",indexPath.row];
    return cell;
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
