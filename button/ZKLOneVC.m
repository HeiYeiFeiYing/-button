//
//  ZKLOneVC.m
//  button
//
//  Created by 张昆龙 on 2020/6/30.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ZKLOneVC.h"
#import "SkinTool.h"

#import "ZKLLabel.h"

#import "ZKLImageView.h"
@interface ZKLOneVC ()
@property(nonatomic, strong) UIButton     *button1;

@property(nonatomic, strong) UILabel      *lable1;
@property(nonatomic, strong) ZKLLabel      *lable2;

@end

@implementation ZKLOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"1233";
    
//    self.view.backgroundColor = UIColor.whiteColor;
    
    [self lable1];
    [self lable2];

        
        UIBarButtonItem *butim2 = [[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStyleDone target:self action:@selector(dian)];
        
        self.navigationItem.rightBarButtonItems = @[butim2];
    
    ZKLImageView *imag_K = [[ZKLImageView alloc]initWithFrame:CGRectMake(120,50, 100, 100)];
    
    imag_K.image =[SkinTool skinToolWithImageName:@"red-Image"];;
    
    [self.view addSubview:imag_K];
    
}
-(void)dian{
        NSString *value = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
        if ([value isEqualToString:@"red"]) {
               
            [SkinTool setSkincolor:@"red2"];

        }else{
            [SkinTool setSkincolor:@"red"];
        }
        
        
    }
-(UILabel *)lable1{
    
    if (!_lable1) {
        _lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
        _lable1.textAlignment = NSTextAlignmentLeft;
    
        _lable1.text          = @"法币币种";
        [self.view addSubview:_lable1];
    }
    return _lable1;
}

-(ZKLLabel *)lable2{
    
    if (!_lable2) {
        _lable2 = [[ZKLLabel alloc]init];
        _lable2.textAlignment = NSTextAlignmentLeft;
        [_lable2 buttClock];

        [self.view addSubview:_lable2];
        
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"法币币种"];
     
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
        
        _lable2.attributedText = string;
        
        _lable2.frame = CGRectMake(0, 300, 100, 100);
    }
    return _lable2;
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
