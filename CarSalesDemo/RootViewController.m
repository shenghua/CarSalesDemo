//
//  RootViewController.m
//  CarSalesDemo
//
//  Created by wsh on 7/5/13.
//  Copyright (c) 2013 wsh. All rights reserved.
//

#import "RootViewController.h"
#import "CustomSearchBar.h"
#import "SalesTableViewController.h"

@implementation RootViewController

@synthesize mySearchBar;

#pragma mark - View life cycle
- (void)dealloc
{
    [mySearchBar release];
    
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    
    mySearchBar = [[CustomSearchBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, 44.0)];
    mySearchBar.delegate = self;
    mySearchBar.showsCancelButton = YES;
    mySearchBar.showsSearchResultsButton = YES;
    mySearchBar.showsScopeBar = YES;
    
    [self.view addSubview:mySearchBar];
    [mySearchBar release];
    
    NSMutableDictionary *trDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableArray *leftKeys = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *rightKeys = [NSMutableArray arrayWithCapacity:0];
    int leftNumber = 3;
    for (int i = 0; i < 6; i++) {
        NSString *key = [NSString stringWithFormat:@"tr_%d", i];
        [trDict setValue:[NSNumber numberWithFloat:60.0] forKey:key];
        if (i < leftNumber) {
            [leftKeys addObject:key];
        } else {
            [rightKeys addObject:key];
        }
    }
    NSArray *titleArray = @[@"排名", @"车型", @"销量", @"同比", @"环比", @"份额"];
    NSMutableArray *dArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 50; i ++) {
        NSMutableDictionary *data = [NSMutableDictionary dictionaryWithCapacity:0];
        int j = 0;
        for (NSString *key in trDict) {
            NSString *value = [NSString stringWithFormat:@"%@ %d", key, i];
            if (i == 0) {
                value = [NSString stringWithFormat:@"%@", [titleArray objectAtIndex:j]];
            }
            
            [data setValue:value forKey:key];
            j++;
        }
        [dArray addObject:data];
    }
    
    SalesTableViewController *view = [[SalesTableViewController alloc] initWithData:dArray trDictionary:trDict size:CGSizeMake(self.view.frame.size.width, 400) scrollMethod:kScrollMethodWithRight leftDataKeys:leftKeys rightDataKeys:rightKeys];
    CGRect frame = view.frame;
    frame.origin = CGPointMake(0, 44);
    view.frame = frame;
    [self.view addSubview:view];
    [view release];
}

- (void)viewDidUnload
{
    [mySearchBar release];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    float systemVserion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVserion >= 6.0)
    {
        self.mySearchBar = nil;
        self.view = nil;
    }
}

- (void)back
{
    
}

- (void)save
{
    
}

#pragma mark -
#pragma mark UISearchBarDelegate

// called when the bookmark button inside the search bar is tapped
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    //..
}

// called when keyboard search button pressed
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
	[self.mySearchBar resignFirstResponder];
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[self.mySearchBar resignFirstResponder];
}

@end
