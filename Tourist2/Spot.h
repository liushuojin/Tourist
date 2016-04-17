//
//  Spot.h
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/17.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Spot : NSObject

@property NSNumber* id;
@property NSString* name;
@property NSString* pic;
@property NSString* trans;

+ (instancetype)spotWithDict:(NSDictionary *)dict;
@end
