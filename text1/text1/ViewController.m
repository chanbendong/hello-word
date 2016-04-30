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
#import "HPGrowingTextView.h"
@interface ViewController ()<HPGrowingTextViewDelegate>

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController
{
    NSString *fram;
    HPGrowingTextView *textview;
    float heightText;//文字高度
    UIImageView *imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    textview = [[HPGrowingTextView alloc]initWithFrame:CGRectMake(50, 50, 100, 30) textContainer:nil];
    textview.delegate =self;
    textview.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    textview.backgroundColor = [UIColor redColor];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.userInteractionEnabled = YES;
    [textview addSubview:imageView];
    [self.view addSubview:imageView];
    [self.view addSubview:textview];
    NSLog(@"xxx");
}

- (void)add
{
//    NSLog(@"view.text is %@",textview.text);
}

- (void)growingTextView:(HPGrowingTextView *)growingTextView didChangeHeight:(float)height
{
    CGRect frame = imageView.frame;
    frame.size.height = height;
    imageView.frame = frame;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
