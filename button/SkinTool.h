//
//  SkinTool.h
//  button
//
//  Created by 张昆龙 on 2020/6/30.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define skinColorKey @"skinColor"

NS_ASSUME_NONNULL_BEGIN

@interface SkinTool : NSObject

+ (void)setSkincolor:(NSString *)skinColor;

+ (UIColor *)skinToolWithLabelColor;

+ (UIColor *)skinToolWithLabelColor1;

+ (UIColor *)skinToolWithLabelColor2;

+(NSDictionary*)path;

+ (UIImage *)skinToolWithImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
