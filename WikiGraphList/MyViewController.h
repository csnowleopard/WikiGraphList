//
//  MyViewController.h
//  WikiGraphList
//
//  Created by Christopher Sadowski on 2/5/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WikipediaHelper.h"

@interface MyViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UINavigationItem *Title;

@property (weak, nonatomic) IBOutlet UISearchBar *Search;
@property (strong, nonatomic)  NSMutableArray *arr;
@end
