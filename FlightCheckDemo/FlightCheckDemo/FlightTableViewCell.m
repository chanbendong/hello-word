//
//  FlightTableViewCell.m
//  FlightCheckDemo
//
//  Created by easub on 16/4/21.
//  Copyright © 2016年 easub. All rights reserved.
//

#import "FlightTableViewCell.h"

@implementation FlightTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)reloadDataFromModel:(FlightModel *)model
{
    _fromPlace.text = [NSString stringWithFormat:@"From %@",model.fromPlace];
    _toPlace.text = [NSString stringWithFormat:@"To %@",model.toPlace];
    _Price.text = [NSString stringWithFormat:@"Price: %@",model.price];
    _flightCompany.text = [NSString stringWithFormat:@"%@",model.flightCompany];
    [_flightCompany setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    _flightPlane.text = model.flightPlane;
    _fromDate.text = model.fromDate;
    _toDate.text = model.toDate;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
