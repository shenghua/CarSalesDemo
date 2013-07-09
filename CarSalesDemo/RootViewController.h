//
//  RootViewController.h
//  CarSalesDemo
//
//  Created by wsh on 7/5/13.
//  Copyright (c) 2013 wsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomSearchBar;
@interface RootViewController : UIViewController <UISearchBarDelegate>

@property (nonatomic, retain) CustomSearchBar *mySearchBar;

@end
