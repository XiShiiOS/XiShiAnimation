//
//  UIButton+XSAShakingButton.h
//  ShakeButtonDemo
//
//  Created by xishi on 2017/1/16.
//  Copyright © 2017年 xs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XSAShakingButton)
- (void)shakeWithStoppedBlock:(void (^)())stoppedBlock;
@end
