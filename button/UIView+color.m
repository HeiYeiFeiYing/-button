//
//  UIView+color.m
//  button
//
//  Created by 张昆龙 on 2020/7/2.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "UIView+color.h"
#import <objc/runtime.h>

#import "SkinTool.h"
@implementation UIView (color)
@dynamic state;

-(void)clocr1{
    
    self.backgroundColor = [SkinTool skinToolWithLabelColor1];
        
    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];
}
- (void)defaultsChanged:(NSNotification *)notification {
  //获取图片名称
    switch (self.state) {
        case SKYStateRed:{
            self.backgroundColor = UIColor.yellowColor;
        }
            break;
       case SKYStateRed2:{
            self.backgroundColor = UIColor.purpleColor;
        }
            break;
        case SKYStateOther:{
            
            self.backgroundColor = UIColor.orangeColor;
        }
            break;
        default:
            break;
    }    
}

-(void)setState:(SKYState)state{
    
    objc_setAssociatedObject(self, @"state", [NSNumber numberWithInt:state], OBJC_ASSOCIATION_COPY_NONATOMIC);

}

-(SKYState)state{
    NSString * k = objc_getAssociatedObject(self, @"state");
    return [k intValue];
}


@end
