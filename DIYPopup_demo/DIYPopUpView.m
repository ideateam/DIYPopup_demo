//
//  DIYPopUpView.m
//  DIYPopup_demo
//
//  Created by MacOS on 2018/7/6.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import "DIYPopUpView.h"

@implementation DIYPopUpView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _fullBackRect = frame;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"transparency"]];
    }
    return self;
}
-(void)hidePopView{
    
    
    __weak __typeof__(self) weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        
        weakSelf.popShowView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        weakSelf.popShowView.alpha = 0.01;
        
    } completion:^(BOOL finished) {
        weakSelf.popShowView.transform = CGAffineTransformMakeScale(0.0, 0.0);
        weakSelf.popShowView.alpha = 0.00;
        weakSelf.alpha = 0.00;
        weakSelf.popShowView.hidden = YES;
        weakSelf.cancelButton2.hidden = YES;
        weakSelf.hidden = YES;
        [weakSelf removeFromSuperview];
    }];
    
    
}
-(void)showPopView{
    
    
    [self.popShowView addSubview:self.imageV];
    [self.popShowView addSubview:self.popTitle];
    [self.popShowView addSubview:self.price];
    [self.popShowView addSubview:self.cancelButton];
    [self addSubview:self.cancelButton2];
    [self addSubview:self.popShowView];
    

    //UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    //[window addSubview:self];
    
    _popShowView.transform = CGAffineTransformMakeScale(0, 0);
    
    __weak __typeof__(self) weakSelf = self;
    
    [UIView animateWithDuration:0.4 animations:^{
        weakSelf.popShowView.alpha = 1;
        weakSelf.cancelButton2.alpha = 1;
        weakSelf.popShowView.hidden = NO;
        weakSelf.hidden = NO;
        weakSelf.cancelButton2.hidden = NO;
        weakSelf.popShowView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        weakSelf.popShowView.transform = CGAffineTransformMakeScale(1., 1.);
    }];
    
}
-(void)clickCancelButton{
    NSLog(@"cancell is click");
    
    
    self.cancelButton2.hidden = YES;
    [self hidePopView];
}

-(UIView *)popShowView{
    
    if (!_popShowView) {
        
        _popShowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _fullBackRect.size.width - 80, _fullBackRect.size.height - 250)];
        _popShowView.backgroundColor = [UIColor whiteColor];
        _popShowView.layer.cornerRadius = 30;
        _popShowView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
        _popShowView.layer.shadowOffset = CGSizeMake(2, 5);
        _popShowView.layer.shadowOpacity = 0.5;
        _popShowView.layer.shadowRadius = 5;
        _popShowView.center = CGPointMake(_fullBackRect.size.width/2, _fullBackRect.size.height/2);
        _popShowView.userInteractionEnabled = YES;
        _popShowView.hidden = YES;
        
    }
    return _popShowView;
}
-(UIImageView *)imageV{
    if (!_imageV) {
        
        //图片
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, _popShowView.frame.size.width - 20, _popShowView.frame.size.height * 0.75 - 10)];
        _imageV.image = [UIImage imageNamed:@"58.JPG"];
        [_imageV setContentMode:UIViewContentModeScaleAspectFill];
        _imageV.layer.cornerRadius = 15;
        _imageV.clipsToBounds = YES;

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
        
        _cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(_popShowView.frame.size.width - 40, 0, 40, 40)];
        _cancelButton.backgroundColor = [UIColor clearColor];
        [_cancelButton setImage:[UIImage imageNamed:@"cancelcon"] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton.userInteractionEnabled = YES;
    }
    return _cancelButton;
}
-(UIButton *)cancelButton2{
    if (!_cancelButton2) {
        
        _cancelButton2 = [[UIButton alloc] initWithFrame:CGRectMake(_popShowView.center.x - 20, _popShowView.frame.origin.y + _popShowView.frame.size.height + 20, 40, 40)];
        _cancelButton2.backgroundColor = [UIColor clearColor];
        [_cancelButton2 setImage:[UIImage imageNamed:@"cancelcon"] forState:UIControlStateNormal];
        [_cancelButton2 addTarget:self action:@selector(clickCancelButton) forControlEvents:UIControlEventTouchUpInside];
        _cancelButton2.hidden = YES;
        _cancelButton2.alpha = 0;
        _cancelButton2.userInteractionEnabled = YES;
    }
    return _cancelButton2;
}

@end
