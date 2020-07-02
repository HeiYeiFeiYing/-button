//
//  ViewController.m
//  button
//
//  Created by 张昆龙 on 2020/5/27.
//  Copyright © 2020 ZKL. All rights reserved.
//

#import "ViewController.h"
#import "ZKLCollectionViewCell.h"
#import "SkinTool.h"
#import "ZKLTwoVC.h"
#import "ZKLButton.h"
@interface ViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;
@property(nonatomic, strong) ZKLButton     *button1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = UIColor.whiteColor;
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















-(UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
           // 通过回调方法，动态设置item高度
         flowLayout.minimumLineSpacing= 0;
        flowLayout.minimumInteritemSpacing = 30;
        
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width , 130);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0,0,0);
        //24 +18 42

          _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 130) collectionViewLayout:flowLayout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = UIColor.redColor;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        [self.view addSubview:_collectionView];

           //注册单元格
        [_collectionView registerClass:[ZKLCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

//    return _dataArray.count;
        return 4;

}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identify = @"cell";
    
    ZKLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    
    cell.lable1.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    NSLog(@"====:%ld",indexPath.row);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
}

#pragma timer
- (void)startTimer {
    [self stopTimer];
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timerHandler:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

        // 延迟触发
//        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    }
    
}

- (void)stopTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)timerHandler:(NSTimer *)timer {
    NSLog(@"=======3======:%f",self.collectionView.contentOffset.x);

//    [self.collectionView setContentOffset:CGPointMake(self.view.frame.size.width+self.collectionView.contentOffset.x, 0.f) animated:YES];
    
    int k = (self.collectionView.contentOffset.x/self.view.frame.size.width )+1;

    NSIndexPath *scrollIndexPath;
//
//    if (self.collectionView.contentOffset.x==2*self.view.frame.size.width) {
//        scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    }else{
        
        scrollIndexPath  = [NSIndexPath indexPathForRow:k inSection:0];
//    }


    [self.collectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];


}
//
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"=======1======:%f",scrollView.contentOffset.x);

    if (scrollView.contentOffset.x > 3 * self.view.frame.size.width) {

        scrollView.contentOffset = CGPointMake(0, 0.f);
    }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"=========2====:%f",scrollView.contentOffset.x);

    if (scrollView.contentOffset.x == 3 * self.view.frame.size.width) {

        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

@end
