//
//  ZKLButton.m
//  button
//
//  Created by 张昆龙 on 2020/6/30.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLButton.h"
#import "SkinTool.h"

@implementation ZKLButton
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

    }
    
    return self;
}

- (void)defaultsChanged:(NSNotification *)notification {
  
    UIColor *color = [SkinTool skinToolWithLabelColor];

        UIColor *color1 = [SkinTool skinToolWithLabelColor1];

       self.backgroundColor = color1;
       NSString *file_name = [self.imageView.image accessibilityIdentifier];
       NSLog(@"====file_namefile_namefile_namefile_name==:%@",file_name);
       [self setTitleColor:color forState:0];
    
    
}
-(void)buttClock{
    
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
