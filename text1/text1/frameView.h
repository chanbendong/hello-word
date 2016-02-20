//
//  frameView.h
//  text1
//
//  Created by dong on 16/1/24.
//  Copyright © 2016年 dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface frameView : NSObject


@property (nonatomic, assign) CGRect frame;

+(void)showImage:(UIImageView *)avatarImageView;

@end
