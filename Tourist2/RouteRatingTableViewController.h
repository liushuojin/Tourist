//
//  RouteRatingTableViewController.h
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/24.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteRatingTableViewController : UITableViewController<UITableViewDelegate>


@property NSString* data;
@property NSMutableArray* routeRatings;
@property NSArray* routeRatingArray;

@property NSNumber* routeId;

@end
