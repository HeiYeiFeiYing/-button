//
//  AnavigationViewController.m
//  MAP
//
//  Created by 张昆龙 on 2018/11/15.
//  Copyright © 2018年 ZKL. All rights reserved.
//

#import "AnavigationViewController.h"
#import "SkinTool.h"
@interface AnavigationViewController ()

@end

@implementation AnavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setBarTintColor:UIColor.redColor];
    
    self.navigationBar.tintColor = [UIColor whiteColor];

    [[UINavigationBar appearance] setTranslucent:NO];

    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];//Title的字体
    //MyIMChatViewController

    [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

}

- (void)defaultsChanged:(NSNotification *)notification {
    
    UIColor *color = [SkinTool skinToolWithLabelColor];

    UIColor *color1 = [SkinTool skinToolWithLabelColor1];
  
    self.navigationBar.tintColor = color;
    
    [self.navigationBar setBarTintColor:color1];
    
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :color}];//Title的字体
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if (self.childViewControllers.count==1) {
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];

        viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    }else if (viewController.navigationItem.leftBarButtonItem ==nil && self.viewControllers.count >=0&&self.viewControllers.count !=1){
        //修改返回文字
        viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];

    }
    [super pushViewController:viewController animated:animated];

    viewController.extendedLayoutIncludesOpaqueBars = YES;


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
