//
//  ZKLView1.m
//  button
//
//  Created by 张昆龙 on 2020/7/1.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLView1.h"
#import "SkinTool.h"
@implementation ZKLView1
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self =[super initWithFrame:frame]) {
        
        UIColor *color1 = [SkinTool skinToolWithLabelColor1];

        self.backgroundColor = color1;
        
        [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

    }
    
    return self;
}

- (void)defaultsChanged:(NSNotification *)notification {
  
    [self buttClock];
}
-(void)buttClock{

     UIColor *color1 = [SkinTool skinToolWithLabelColor1];

    self.backgroundColor = color1;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
