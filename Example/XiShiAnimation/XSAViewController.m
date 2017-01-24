//
//  XSAViewController.m
//  XiShiAnimation
//
//  Created by xishi on 01/23/2017.
//  Copyright (c) 2017 xs. All rights reserved.
//

#import "XSAViewController.h"
#import "UIButton+XSAShakingButton.h"

#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height

@interface XSAViewController ()

@end

@implementation XSAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    float kWidth = 80.0;
    float kHeight = 44.0;
    UIButton *button1 = [[UIButton alloc] initWithFrame:
                         CGRectMake((ScreenWidth - kWidth) / 2,
                                    (ScreenHeight - kHeight) / 2 + kHeight + 20,
                                    kWidth,
                                    kHeight)];
    button1.backgroundColor = [UIColor blueColor];
    [button1 setTitle:@"提交" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pressedOkButton1:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pressedOkButton1:(id)sender {
    UIButton *btn = (UIButton *)sender;
    // ... 省略判断按钮是否有效的逻辑
    // 显示动画
    [btn shakeWithStoppedBlock:^{
        // 动画结束后的处理
        NSLog(@"shaking end");
    }];
}

@end
