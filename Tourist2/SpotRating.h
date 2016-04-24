//
//  SpotRating.h
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/24.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpotRating : NSObject


@property NSNumber* id;
@property NSNumber* score;
@property NSString* comment;
@property NSNumber* spotId;
@property NSNumber* userId;

+ (instancetype)spotWithDict:(NSDictionary *)dict;

@end
