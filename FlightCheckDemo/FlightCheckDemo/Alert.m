//
//  Alert.m
//  TingYou
//
//  Created by easub on 16/1/26.
//  Copyright © 2016年 听游. All rights reserved.
//

#import "Alert.h"
#import "AppDelegate.h"
@implementation Alert

+ (void)alertWithMessage:(NSString *)message
{
    UIAlertView *alertV = [[UIAlertView alloc]initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertV show];
}




@end
