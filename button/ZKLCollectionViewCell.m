//
//  ZKLCollectionViewCell.m
//  button
//
//  Created by 张昆龙 on 2020/6/22.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLCollectionViewCell.h"

@implementation ZKLCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.yellowColor;
        
        _lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
               _lable1.textAlignment = NSTextAlignmentLeft;
               _lable1.textColor     = UIColor.redColor;
               _lable1.font          = [UIFont systemFontOfSize:15];
               _lable1.text          = @"法币币种";
        _lable1.backgroundColor = UIColor.orangeColor;
        
        [self addSubview:_lable1];
        
    }
    
    return self;
}
-(UILabel *)lable1{
    
    if (!_lable1) {
       
    }
    return _lable1;
}
@end
