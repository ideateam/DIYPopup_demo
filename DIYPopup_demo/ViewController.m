//
//  ViewController.m
//  DIYPopup_demo
//
//  Created by Karl on 2018/6/2.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIView * showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //显示
    UIButton *btnShow = [[UIButton alloc] initWithFrame:CGRectMake(50, 64,100, 50)];
    btnShow.backgroundColor = [UIColor blackColor];
    [btnShow setTitle:@"show" forState:UIControlStateNormal];
    [btnShow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnShow addTarget:self action:@selector(myShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShow];
    
    //隐藏
    UIButton *btnHide = [[UIButton alloc] initWithFrame:CGRectMake(200, 64,100, 50)];
    btnHide.backgroundColor = [UIColor blackColor];
    [btnHide setTitle:@"hide" forState:UIControlStateNormal];
    [btnHide setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnHide addTarget:self action:@selector(myHide) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnHide];
    
    //弹窗父视图
    _showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, self.view.frame.size.height-250)];
    _showView.backgroundColor = [UIColor whiteColor];
    _showView.layer.cornerRadius = 30;
    _showView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    _showView.layer.shadowOffset = CGSizeMake(2, 5);
    _showView.layer.shadowOpacity = 0.5;
    _showView.layer.shadowRadius = 5;
    _showView.center = self.view.center;
    _showView.hidden = YES;
    [self.view addSubview:_showView];
    
    //图片
    UIImageView * imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, _showView.frame.size.width-20, _showView.frame.size.height * 0.75-10)];
    [imageV setContentMode:UIViewContentModeScaleAspectFill];
    imageV.clipsToBounds = YES;
    imageV.image = [UIImage imageNamed:@"58.JPG"];
    [_showView addSubview:imageV];
    _showView.transform = CGAffineTransformMakeScale(0, 0);
    
    //文字
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, imageV.frame.origin.y + imageV.frame.size.height +10, imageV.frame.size.width-40, 30)];
    title.text = @"正品头层牛皮商务横款男士钱包【在售价186元】券后【56元】";
    title.font = [UIFont systemFontOfSize:15];
    title.numberOfLines = 2;
    [_showView addSubview:title];
    //价格
    UILabel *price = [[UILabel alloc] initWithFrame:CGRectMake(20, title.frame.origin.y + title.frame.size.height + 5, imageV.frame.size.width-40, 15)];
    price.font = [UIFont systemFontOfSize:13];
    price.text = @"售价：186元                销量：10000+";
    [_showView addSubview:price];
}
//隐藏
-(void)myHide{
    
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        
        weakSelf.showView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        weakSelf.showView.alpha = 0.01;
        
    } completion:^(BOOL finished) {
        weakSelf.showView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        weakSelf.showView.alpha = 0.00;
        weakSelf.showView.hidden = YES;
    }];
}
//显示
-(void)myShow{
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.showView.alpha = 1;
        weakSelf.showView.hidden = NO;
        weakSelf.showView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        weakSelf.showView.transform = CGAffineTransformMakeScale(1., 1.);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
