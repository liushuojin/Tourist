//
//  Spot.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/17.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "Spot.h"

@implementation Spot

+ (instancetype)spotWithDict:(NSDictionary *)dict {
    Spot *s = [[self alloc] init];
    
    [s setValuesForKeysWithDictionary:dict];
    
    return s;
}

@end
