//
//  UIView+color.h
//  button
//
//  Created by 张昆龙 on 2020/7/2.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (color)


typedef enum SKYState {
    SKYStateRed  = 0,
    SKYStateRed2,
    SKYStateOther
} SKYState;

@property (nonatomic,assign) SKYState state; //操作类型

-(void)clocr1;
@end

NS_ASSUME_NONNULL_END
