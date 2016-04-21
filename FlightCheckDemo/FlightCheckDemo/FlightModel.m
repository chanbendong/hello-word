//
//  FlightModel.m
//  FlightCheckDemo
//
//  Created by easub on 16/4/21.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "FlightModel.h"

@implementation FlightModel

+ (instancetype)instanceWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}

@end
