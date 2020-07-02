//
//  OViewController.m
//  button
//
//  Created by 张昆龙 on 2020/7/1.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "OViewController.h"
#import "SkinTool.h"
#import "ZKLTwoVC.h"
#import "ZKLButton.h"

@interface OViewController ()
@property(nonatomic, strong) ZKLButton     *button1;
@end

@implementation OViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"123aafsdasadsa3";

    //    [self collectionView];
    //
    //    [self startTimer];
        
        UIBarButtonItem *butim2 = [[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStyleDone target:self action:@selector(dian)];
        
        self.navigationItem.rightBarButtonItems = @[butim2];
        
        [self button1];
        
        [self setLabelTextColorAndButtonTitleColor];

        
    }
    -(void)dian{
        NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
        if ([value isEqualToString:@"red"]) {
               
            [SkinTool setSkincolor:@"red2"];

        }else{
            [SkinTool setSkincolor:@"red"];
        }
        
        [self setLabelTextColorAndButtonTitleColor];
        
    }
    - (void)setLabelTextColorAndButtonTitleColor{
        UIColor *color = [SkinTool skinToolWithLabelColor];
        UIColor *color1 = [SkinTool skinToolWithLabelColor1];

    //    [[UIButton appearance] setTitleColor:color forState:UIControlStateNormal];
    //    [[UIButton appearance] setBackgroundColor:color1];
        
        _button1.backgroundColor = color1;
        
        [_button1 setTitleColor:color forState:0];

    }

    -(ZKLButton *)button1{
        
        if (!_button1) {
            _button1 = [[ZKLButton alloc]init];
            
            [_button1 setTitle:@"查看" forState:0];
            [_button1 setImage:[UIImage imageNamed:@"KKK"] forState:0];
            _button1.layer.cornerRadius = 5;
            _button1.layer.masksToBounds = YES;
            [_button1 addTarget:self action:@selector(clickButton:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.view addSubview:_button1];
            _button1.frame = CGRectMake(0, 100, 100, 100);
            
        }
        return _button1;
    }
    -(void)clickButton:(UIButton*)click{
        ZKLTwoVC *VC = [[ZKLTwoVC alloc]init];
        
        [self.navigationController pushViewController:VC animated:NO];
        
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
