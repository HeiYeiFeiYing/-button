//
//  MapTabBarViewController.m
//  MAP
//
//  Created by 张昆龙 on 2018/11/5.
//  Copyright © 2018年 ZKL. All rights reserved.
//

#import "MapTabBarViewController.h"
#import "AnavigationViewController.h"
#import "KViewController.h"
#import "OViewController.h"
#import "SkinTool.h"
@interface MapTabBarViewController ()<UITabBarControllerDelegate>
@property(nonatomic, strong) KViewController       *homVc;
@property(nonatomic, strong) OViewController   *tradingVc;


@end
 
@implementation MapTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    [[UITabBar appearance] setBackgroundColor:ThemeColor];
//    self.tabBar.backgroundColor = ThemeColor;
    
    [[UITabBar appearance] setBarTintColor:UIColor.yellowColor];
    [UITabBar appearance].translucent = NO;
    
    [self myIsGo:NO IsGo:NO IsGo:NO IsGo:NO];

    
    self.delegate = self;
    
     [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(defaultsChanged:) name:NSUserDefaultsDidChangeNotification object:nil];

}
- (void)defaultsChanged:(NSNotification *)notification {
    
    UIColor *color1 = [SkinTool skinToolWithLabelColor1];
    UIColor *color = [SkinTool skinToolWithLabelColor];


    UIImage *tabbarImage = [self imageWithColor:color1];
    
    self.tabBar.backgroundImage = tabbarImage;

       self.tabBar.tintColor = color;    
}

- (UIImage *)imageWithColor:(UIColor *)color

{

    CGRect rect = CGRectMake(0, 0, 1, 1);

    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);

    [color setFill];

    UIRectFill(rect);

    

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    

    return image;

}
-(void)myIsGo:(BOOL)isGo IsGo:(BOOL)isGo2 IsGo:(BOOL)isGo3 IsGo:(BOOL)isGo4{
    //主页
    _homVc        = [[KViewController alloc]init];
//    _homVc.view.backgroundColor          = [UIColor whiteColor];
    _homVc.extendedLayoutIncludesOpaqueBars = YES;

    AnavigationViewController *homeNav = [[AnavigationViewController alloc] initWithRootViewController:_homVc];

    [self controller:homeNav Title:@"首页" tabBarItemImage:@"首页" tabBarItemSelectedImage:@"首页选中"];


    //消息
    _tradingVc         = [[OViewController alloc]init];

    AnavigationViewController *findNav  = [[AnavigationViewController alloc] initWithRootViewController:_tradingVc];

    [self controller:findNav Title:@"交易" tabBarItemImage:@"交易" tabBarItemSelectedImage:@"交易选中"];

    self.viewControllers = @[homeNav,findNav];
    
//    UIView *bgView = [[UIView alloc] initWithFrame:self.view.bounds];
//       bgView.backgroundColor = [UIColor redColor];
//       [self.view insertSubview:bgView atIndex:0];
//       self.view.opaque = YES;
    
}

//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
//    // 如果点击了中间的controller
//
////    if([viewController.tabBarItem.title isEqualToString:NSLocalizedString(@"聊天", nil)]||[viewController.tabBarItem.title isEqualToString:NSLocalizedString(@"交易", nil)]||[viewController.tabBarItem.title isEqualToString:NSLocalizedString(@"订单", nil)]||[viewController.tabBarItem.title isEqualToString:NSLocalizedString(@"钱包", nil)]){
////
////        if (!LOGINSTATUS) {
////            LoginViewController * logView = [[LoginViewController alloc]init];
////            logView.modalPresentationStyle = UIModalPresentationFullScreen;
////
////            [self presentViewController:logView animated:YES completion:nil];
////            return NO;
////
////        }else{
////            return YES;
////        }
////
////    }else{
////        return YES;
////
////    }
//    return YES;
//
//}
- (void)controller:(UIViewController *)controller Title:(NSString *)title tabBarItemImage:(NSString *)image tabBarItemSelectedImage:(NSString *)selectedImage
{
    controller.tabBarItem.title = title;
//    controller.tabBarItem.image = [UIImage imageNamed:image];
    // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
//    UIImage *imageHome = [UIImage imageNamed:selectedImage];
//    imageHome = [imageHome imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [controller.tabBarItem setSelectedImage:imageHome];
//     设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
//    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:UIColor.yellowColor forKey:NSForegroundColorAttributeName];
//    self.tabBar.tintColor = [UIColor colorWithHexString:@"#029BDD"];

//    [controller.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];

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
