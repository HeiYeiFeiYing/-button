//
//  SkinTool.m
//  button
//
//  Created by 张昆龙 on 2020/6/30.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "SkinTool.h"

@implementation SkinTool

static NSString *_skinColor;

// 这个类第一次使用的时候调用,而且只会调用一次
+ (void)initialize
{
    NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:skinColorKey];
    if (value == nil) {
        value = @"red";
    }
    _skinColor = value;

}

+ (void)setSkincolor:(NSString *)skinColor
{
    _skinColor = skinColor;
    // 保存用户选中的皮肤颜色
    [[NSUserDefaults standardUserDefaults] setObject:skinColor forKey:skinColorKey];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
// 图片
+ (UIImage *)skinToolWithImageName:(NSString *)imageName
{
    
    NSArray *colorArr = [imageName componentsSeparatedByString:@"-"];

    // 拼接图片路径
    NSString *imagePath;
    if (colorArr.count>=2) {
        imagePath = [NSString stringWithFormat:@"%@-%@",_skinColor,colorArr[1]];

    }else if(colorArr.count==1){
        imagePath = [NSString stringWithFormat:@"%@-%@",_skinColor,colorArr[0]];
    }
    return [UIImage imageNamed:imagePath];
}

// 返回一个plist文件中RGB颜色
+ (UIColor *)skinToolWithLabelColor
{
    NSDictionary *colorDict = [self path];
    NSString *colorStr = colorDict[@"labelBgColor"];
    
    // 4.获取颜色数组
    NSArray *colorArr = [colorStr componentsSeparatedByString:@","];
    
    // 5.读取对应RGB
    NSInteger red = [colorArr[0] integerValue];
    NSInteger green = [colorArr[1] integerValue];
    NSInteger blue = [colorArr[2] integerValue];
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}
+ (UIColor *)skinToolWithLabelColor1
{

    NSDictionary *colorDict = [self path];
    NSString *colorStr = colorDict[@"labelBgColor1"];
    
    // 4.获取颜色数组
    NSArray *colorArr = [colorStr componentsSeparatedByString:@","];
    
    // 5.读取对应RGB
    NSInteger red = [colorArr[0] integerValue];
    NSInteger green = [colorArr[1] integerValue];
    NSInteger blue = [colorArr[2] integerValue];
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (UIColor *)skinToolWithLabelColor2
{

    NSDictionary *colorDict = [self path];
    NSString *colorStr = colorDict[@"labelBgColor2"];
    
    // 4.获取颜色数组
    NSArray *colorArr = [colorStr componentsSeparatedByString:@","];
    
    // 5.读取对应RGB
    NSInteger red = [colorArr[0] integerValue];
    NSInteger green = [colorArr[1] integerValue];
    NSInteger blue = [colorArr[2] integerValue];
    
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}


+(NSDictionary*)path{
    // 1.获取对应plist文件名称
      NSString *plistName = [NSString stringWithFormat:@"%@Color.plist",_skinColor];

      // 2.获取对应plist文件路径
      NSString *plistPath = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
      // 3.读取plist文件
      NSDictionary *colorDict = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    return colorDict;
    
}
@end
