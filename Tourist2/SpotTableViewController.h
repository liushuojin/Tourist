//
//  SpotTableViewController.h
//  Tourist2
//
//  Created by 刘硕晋 on 16/4/16.
//  Copyright © 2016年 ginkee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpotTableViewController : UITableViewController<UITableViewDelegate>

@property NSString* data;
@property NSMutableArray* spots;
@property NSArray* spotArray;

@end
