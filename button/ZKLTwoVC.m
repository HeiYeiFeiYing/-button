//
//  ZKLTwoVC.m
//  button
//
//  Created by 张昆龙 on 2020/6/30.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLTwoVC.h"
#import "SkinTool.h"
#import "ZKLLabel.h"
#import "ZKLView1.h"
#import "UIView+color.h"
@interface ZKLTwoVC ()
@property(nonatomic, strong) ZKLLabel      *lable1;
@property(nonatomic, strong) ZKLView1      *view22;
@end

@implementation ZKLTwoVC
-(ZKLView1 *)view22{
    
    if(!_view22){
        _view22 = [[ZKLView1 alloc]init];
        _view22.frame = CGRectMake(200, 100, 100, 100);
//        _view22.backgroundColor = UIColor.yellowColor;
        
        [self.view addSubview:_view22];
    }
    
    return _view22;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.title = @"1233rrrrrrr";
    
    [self view22];
    
    UIBarButtonItem *butim2 = [[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStyleDone target:self action:@selector(dian)];
    
    self.navigationItem.rightBarButtonItems = @[butim2];
    
    [self lable1];
    
//    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(150, 300, 100, 100)];
    view1.state = SKYStateRed;
    [view1 clocr1];
    
    [self.view addSubview:view1];
    
    
    
    
    
    
    
}
-(void)dian{
    NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
    if ([value isEqualToString:@"red"]) {
           
        [SkinTool setSkincolor:@"red2"];

    }else{
        [SkinTool setSkincolor:@"red"];
    }
    
    
}
-(ZKLLabel *)lable1{
    
    if (!_lable1) {
        _lable1 = [[ZKLLabel alloc]init];
        _lable1.textAlignment = NSTextAlignmentLeft;
        
        [_lable1 buttClock];

        _lable1.text          = @"法币币种";
        [self.view addSubview:_lable1];
        
        _lable1.frame = CGRectMake(0, 300, 100, 100);

    }
    return _lable1;
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
