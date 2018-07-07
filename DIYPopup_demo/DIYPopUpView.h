//
//  DIYPopUpView.h
//  DIYPopup_demo
//
//  Created by MacOS on 2018/7/6.
//  Copyright © 2018年 Derek. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIYPopUpView : UIView

@property (nonatomic,assign) CGRect fullBackRect;
@property (nonatomic,strong) UIView *popShowView;

@property (nonatomic,strong) UIImageView *imageV;
@property (nonatomic,strong) UILabel *popTitle;
@property (nonatomic,strong) UILabel *price;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *cancelButton2;

-(void)hidePopView;
-(void)showPopView;

@end
