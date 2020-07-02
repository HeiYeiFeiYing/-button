//
//  ZKLVC.m
//  button
//
//  Created by 张昆龙 on 2020/7/1.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLVC.h"
#import "SkinTool.h"
@interface ZKLVC ()

@end

@implementation ZKLVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];
    
    UIColor *color1 = [SkinTool skinToolWithLabelColor2];

    self.view.backgroundColor = color1;

}

- (void)defaultsChanged:(NSNotification *)notification {
  
    UIColor *color1 = [SkinTool skinToolWithLabelColor2];

    self.view.backgroundColor = color1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
