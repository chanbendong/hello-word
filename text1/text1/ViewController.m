//
//  ViewController.m
//  text1
//
//  Created by dong on 16/1/20.
//  Copyright © 2016年 dong. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "frameView.h"
@interface ViewController ()

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController
{
    CGRect fram;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 80)];
    
    image.image = [UIImage imageNamed:@"1.jpg"];

    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 50, 200, 100)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 8;
    view.layer.masksToBounds = YES;
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(20, 50, 200, 100)];
    backView.layer.shadowOpacity = 0.5;

    backView.layer.shadowOffset = CGSizeMake(0, 3);
    backView.layer.shadowColor = [UIColor blackColor].CGColor;

    [backView addSubview:view];
    [view addSubview:image];
    [self.view addSubview:backView];
    self.view.backgroundColor = [UIColor redColor];

   
    
}

- (void)click:(UITapGestureRecognizer *)tgr
{
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
