//
//  SpotRating.m
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/24.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import "SpotRating.h"

@implementation SpotRating

+ (instancetype)spotWithDict:(NSDictionary *)dict {
    SpotRating *s = [[self alloc] init];
    
    [s setValuesForKeysWithDictionary:dict];
    
    return s;
}

@end
