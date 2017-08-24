//
//  ViewController.m
//  GuideDemo
//
//  Created by BillBo on 2017/7/6.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ViewController.h"

#pragma mark - === UIColor定义的宏 ===
#define RGB(R,G,B) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]


#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]


#define HEX_RGB(V) [UIColor fromHexValue:V]


#define HEX_RGBA(V, A) [UIColor fromHexValue:V alpha:A]


#define SHORT_RGB(V) [UIColor fromShortHexValue:V]


@interface ViewController ()

@property(nonatomic,strong) UILabel *lb;

@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 30)];
    
    self.lb.backgroundColor = [UIColor cyanColor];
    
    self.lb.center = self.view.center;
    
    self.lb.textAlignment = NSTextAlignmentRight;
    
    self.lb.text = @"点击这里哦!";
    
    self.lb.font = [UIFont systemFontOfSize:15.0f];
    
    self.lb.textColor = [UIColor redColor];
    
    [self.view addSubview:self.lb];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(0, 0, 90, 40);
    
    [btn setTitle:@"新手指导" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor purpleColor];
    
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(newUserGuide) forControlEvents:UIControlEventTouchUpInside];
    
    btn.center = CGPointMake(self.lb.center.x, self.lb.center.y + 50);
    
    [self.view addSubview:btn];
}

#pragma mark - 新手指导

- (void)newUserGuide {
    
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *bgView = [[UIView alloc] initWithFrame:frame];
    
    bgView.backgroundColor = [UIColor blackColor];
    
    bgView.alpha = 0.2;
    
    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] init];
    
    [bgView addGestureRecognizer:tapG];
    
    [tapG addTarget:self action:@selector(handleTapAction:)];
    
    [self.view addSubview:bgView];
//    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    
    //create path 添加第一个路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
    
    //添加第二个路径(这是一个圆)
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.width - 30, 42) radius:30 startAngle:0 endAngle:2 * M_PI clockwise:NO]];
    
    //添加第三个路径(这个是矩形)
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:self.lb.frame cornerRadius:5] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    [bgView.layer setMask:shapeLayer];
    
    
    
}

- (void)handleTapAction:(UITapGestureRecognizer *)sender {
    
    UIView *v = sender.view;
    [v removeFromSuperview];
    
    for (UIView *subV in v.subviews) {
        
        [subV removeFromSuperview];
        
    }
    [v removeGestureRecognizer:sender];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
