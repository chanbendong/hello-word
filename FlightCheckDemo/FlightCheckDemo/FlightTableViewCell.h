//
//  FlightTableViewCell.h
//  FlightCheckDemo
//
//  Created by easub on 16/4/21.
//  Copyright © 2016年 easub. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlightModel.h"
@interface FlightTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fromPlace;
@property (weak, nonatomic) IBOutlet UILabel *toPlace;
@property (weak, nonatomic) IBOutlet UILabel *Price;
@property (weak, nonatomic) IBOutlet UILabel *flightCompany;
@property (weak, nonatomic) IBOutlet UILabel *fromDate;
@property (weak, nonatomic) IBOutlet UILabel *toDate;
@property (weak, nonatomic) IBOutlet UILabel *flightPlane;

- (void)reloadDataFromModel:(FlightModel *)model;

@end
