//
//  MyViewController.m
//  DIYPopup_demo
//
//  Created by MacOS on 2018/7/6.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import "MyViewController.h"
#import "DIYPopUpView.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button];
    
    
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    DIYPopUpView *diy = [[DIYPopUpView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [window addSubview:diy];
    [diy showPopView];
    
    
    
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
