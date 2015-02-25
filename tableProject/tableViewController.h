//
//  tableViewControllerTableViewController.h
//  tableProject
//
//  Created by João Vitor dos Santos Schimmelpfeng on 25/02/15.
//  Copyright (c) 2015 João Vitor dos Santos Schimmelpfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewController : UITableViewController
@property NSMutableArray *apps;
- (IBAction)editar:(id)sender;
@property NSMutableArray *imgs;
@property NSMutableArray *desc;
@end
