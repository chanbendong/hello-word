//
//  FlightModel.h
//  FlightCheckDemo
//
//  Created by easub on 16/4/21.
//  Copyright © 2016年 easub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlightModel : NSObject

@property (nonatomic, strong) NSString *flightCompany;
@property (nonatomic, strong) NSString *fromDate;
@property (nonatomic, strong) NSString *toDate;
@property (nonatomic, strong) NSString *fromPlace;
@property (nonatomic, strong) NSString *toPlace;
@property (nonatomic, strong) NSString *flightPlane;
@property (nonatomic, strong) NSString *price;

+ (instancetype)instanceWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
