//
//  ViewController.m
//  FlightCheckDemo
//
//  Created by easub on 16/4/21.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "ViewController.h"
#import "ZJPickView.h"
#import "FligtViewController.h"
#import "Alert.h"
@interface ViewController ()<ZJPickViewDelegate>
@property (nonatomic, strong) ZJPickView *zjPickerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _check.layer.cornerRadius = 4;
    _check.layer.masksToBounds = YES;
    
}
- (IBAction)chooseTime:(id)sender {
    [self.view endEditing:YES];
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    _zjPickerView = [[ZJPickView alloc]initDatePickWithDate:date datePickerMode:UIDatePickerModeDate isHaveNavControler:YES];
    _zjPickerView.delegate = self;
    _zjPickerView.backgroundColor = [UIColor lightGrayColor];
    [_zjPickerView show];
    
}
- (IBAction)checkFlight:(id)sender {
    [self.view endEditing:YES];
    if (_fromPlace.text.length && _toPlace.text.length && ![_time.text isEqualToString:@"出发时间"]) {
        FligtViewController *flight = [[FligtViewController alloc]init];
        flight.toTime = _time.text;
        flight.fromPlace = _fromPlace.text;
        flight.toPlace = _toPlace.text;
        [self.navigationController pushViewController:flight animated:YES];
    }else{
        [Alert alertWithMessage:@"输入非法"];
    }
   
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)toobarDonBtnHaveClick:(ZJPickView *)pickView resultString:(NSString *)resultString
{
    NSArray *dateArr = [resultString componentsSeparatedByString:@" "];
    _time.text = [dateArr firstObject];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
