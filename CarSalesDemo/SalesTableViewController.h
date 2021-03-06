//
//  SalesTableViewController.h
//  CarSalesDemo
//
//  Created by wsh on 7/8/13.
//  Copyright (c) 2013 wsh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kScrollMethodWithLeft = 0,//左边滚动
    kScrollMethodWithRight,//右边滚动
    kScrollMethodWithAll
}ScrollMethod;

#define kTableViewCellHeight 40.0

@interface SalesTableViewController : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UITableView *leftTableView;
@property (nonatomic, retain) UITableView *rightTableView;
@property (nonatomic, retain) UIScrollView *leftScrollView;
@property (nonatomic, retain) UIScrollView *rightScrollView;
@property (nonatomic, retain) NSArray *dataArray;
@property (nonatomic, retain) NSDictionary *trDictionary;
@property (nonatomic, retain) NSArray *leftDataKeys;
@property (nonatomic, retain) NSArray *rightDataKeys;

- (id)initWithData:(NSArray *)dArray trDictionary:(NSDictionary *)trDict size:(CGSize)size scrollMethod:(ScrollMethod)sm leftDataKeys:(NSArray *)leftDataKeys rightDataKeys:(NSArray *)rightDataKeys;

@end
