//
//  ZKLLabel.m
//  button
//
//  Created by 张昆龙 on 2020/6/30.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLLabel.h"
#import "SkinTool.h"

@implementation ZKLLabel
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

    }
    
    return self;
}

- (void)defaultsChanged:(NSNotification *)notification {
  
    [self buttClock];
}
-(void)buttClock{
    
    UIColor *color = [SkinTool skinToolWithLabelColor];

     UIColor *color1 = [SkinTool skinToolWithLabelColor1];

    self.backgroundColor = color1;

    self.textColor = color;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
