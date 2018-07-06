//
//  DIYPopUpView.m
//  DIYPopup_demo
//
//  Created by MacOS on 2018/7/6.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import "DIYPopUpView.h"

@implementation DIYPopUpView

-(void)hidePopView{
    
    //[self.fullBackView addSubview:self.popShowView];
    
    __weak __typeof__(self) weakSelf = self;
    
    [UIView animateWithDuration:0.4 animations:^{
        
        weakSelf.popShowView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        weakSelf.popShowView.alpha = 0.01;
        
        [UIView animateWithDuration:0.4 animations:^{
            
            weakSelf.popShowView.transform = CGAffineTransformMakeScale(0.0, 0.0);
            weakSelf.popShowView.alpha = 0.00;
            weakSelf.popShowView.hidden = YES;
        }];
        
    }];
    
    
}
-(void)showPopView{
    
    
    [self.popShowView addSubview:self.imageV];
    [self.popShowView addSubview:self.popTitle];
    [self.popShowView addSubview:self.price];
    [self.fullBackView addSubview:self.cancelButton];
    [self.fullBackView addSubview:self.popShowView];
    

    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self.fullBackView];
    
    _popShowView.transform = CGAffineTransformMakeScale(0, 0);
    
    __weak __typeof__(self) weakSelf = self;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        weakSelf.popShowView.alpha = 1;
        weakSelf.popShowView.hidden = NO;
        weakSelf.popShowView.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
        [UIView animateWithDuration:1 animations:^{
            
            weakSelf.popShowView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
        
    }];
    
}
-(void)clickCancelButton{
    NSLog(@"cancell is click");
    
    [self hidePopView];
}
-(UIView *)fullBackView{
    
    if (!_fullBackView) {
        
        _fullBackView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _fullBackView.backgroundColor = [UIColor redColor];
        _fullBackView.userInteractionEnabled = YES;
        
    }
    return _fullBackView;
}
-(UIView *)popShowView{
    
    if (!_popShowView) {
        
        _popShowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 80, [UIScreen mainScreen].bounds.size.height - 250)];
        _popShowView.backgroundColor = [UIColor orangeColor];
        _popShowView.layer.cornerRadius = 30;
        _popShowView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        _popShowView.layer.shadowOffset = CGSizeMake(2, 5);
        _popShowView.layer.shadowOpacity = 0.5;
        _popShowView.layer.shadowRadius = 5;
        _popShowView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
        _popShowView.userInteractionEnabled = YES;
        _popShowView.hidden = YES;
        
    }
    return _popShowView;
}
-(UIImageView *)imageV{
    if (!_imageV) {
        
        //图片
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, _popShowView.frame.size.width-20, _popShowView.frame.size.height * 0.75-10)];
        [_imageV setContentMode:UIViewContentModeScaleAspectFill];
        _imageV.clipsToBounds = YES;
        _imageV.image = [UIImage imageNamed:@"58.JPG"];
    }
    return _imageV;
}
-(UILabel *)popTitle{
    
    if (!_popTitle) {
        
        //文字
        _popTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, _imageV.frame.origin.y + _imageV.frame.size.height +10, _imageV.frame.size.width-40, 30)];
        _popTitle.text = @"正品头层牛皮商务横款男士钱包【在售价186元】券后【56元】";
        _popTitle.font = [UIFont systemFontOfSize:15];
        _popTitle.numberOfLines = 2;
    }
    return _popTitle;
}
-(UILabel *)price{
    
    if (!_price) {
        
        _price = [[UILabel alloc] initWithFrame:CGRectMake(20, _popTitle.frame.origin.y + _popTitle.frame.size.height + 5, _imageV.frame.size.width-40, 15)];
        _price.font = [UIFont systemFontOfSize:13];
        _price.text = @"售价：186元                销量：10000+";
    }
    return _price;
}
-(UIButton *)cancelButton{
    if (!_cancelButton) {
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(_popShowView.frame.size.width - 20, _imageV.frame.origin.y, 40, 40)];
        _cancelButton.backgroundColor = [UIColor blueColor];
        [_cancelButton setImage:[UIImage imageNamed:@"cancelcon"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.userInteractionEnabled = YES;
    }
    return _cancelButton;
}

@end
