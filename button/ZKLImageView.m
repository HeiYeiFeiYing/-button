//
//  ZKLImageView.m
//  button
//
//  Created by 张昆龙 on 2020/7/1.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLImageView.h"
#import "SkinTool.h"
@implementation ZKLImageView
-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame ]){
        
        
        [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

    }
    
    return self;
}
- (void)defaultsChanged:(NSNotification *)notification {
  //获取图片名称
    NSString *file_name = [self.image accessibilityIdentifier];
           
    self.image = [SkinTool skinToolWithImageName:file_name];
    NSLog(@"======333===:%@",file_name);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
