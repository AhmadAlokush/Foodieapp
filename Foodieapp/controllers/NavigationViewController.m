//
//  NavigationViewController.m
//  Foodieapp
//
//  Created by AHMAD on 5/20/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "ExploreViewController.h"
#import "ActivityViewController.h"
#import "ProfileViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor colorWithRed:0 green:179/255.0 blue:134/255.0 alpha:1];
     //Should the menu retract back on any click outside the dropdown menu or just on the click on the home button.
    UIButton *backGRound =[[UIButton alloc]initWithFrame:(CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height))];
   
   
   
   UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(toggleMenu)];
   swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
   [[UIApplication sharedApplication].delegate.window addGestureRecognizer:swipeUpGestureRecognizer];
   
   __typeof (&*self) __weak weakSelf = self;
   
   REMenuItem *homeItem = [[REMenuItem alloc] initWithTitle:@"Home"
                                                   subtitle:@"Return to Home Screen"
                                                      image:[UIImage imageNamed:@"Icon_Home"]
                                           highlightedImage:nil
                                                     action:^(REMenuItem *item) {
                                                        NSLog(@"Item: %@", item);
                                                        HomeViewController *controller = [[HomeViewController alloc] init];
                                                        [weakSelf setViewControllers:@[controller] animated:NO];
                                                     }];
   
   REMenuItem *exploreItem = [[REMenuItem alloc] initWithTitle:@"Explore"
                                                      subtitle:@"Explore 47 additional options"
                                                         image:[UIImage imageNamed:@"Icon_Explore"]
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                           NSLog(@"Item: %@", item);
                                                           ExploreViewController *controller = [[ExploreViewController alloc] init];
                                                           [weakSelf setViewControllers:@[controller] animated:NO];
                                                        }];
   
   REMenuItem *activityItem = [[REMenuItem alloc] initWithTitle:@"Activity"
                                                       subtitle:@"Perform 3 additional activities"
                                                          image:[UIImage imageNamed:@"Icon_Activity"]
                                               highlightedImage:nil
                                                         action:^(REMenuItem *item) {
                                                            NSLog(@"Item: %@", item);
                                                            ActivityViewController *controller = [[ActivityViewController alloc] init];
                                                            [weakSelf setViewControllers:@[controller] animated:NO];
                                                         }];
   
   REMenuItem *profileItem = [[REMenuItem alloc] initWithTitle:@"Profile"
                                                         image:[UIImage imageNamed:@"Icon_Profile"]
                                              highlightedImage:nil
                                                        action:^(REMenuItem *item) {
                                                           NSLog(@"Item: %@", item);
                                                           ProfileViewController *controller = [[ProfileViewController alloc] init];
                                                           [weakSelf setViewControllers:@[controller] animated:NO];
                                                        }];
   
      
   homeItem.tag = 0;
   exploreItem.tag = 1;
   activityItem.tag = 2;
   profileItem.tag = 3;
   
   _menu = [[REMenu alloc] initWithItems:@[homeItem, exploreItem, activityItem, profileItem]];
   _menu.cornerRadius = 4;
   _menu.shadowRadius = 4;
   _menu.shadowColor = [UIColor blackColor];
   _menu.shadowOffset = CGSizeMake(0, 1);
   _menu.shadowOpacity = 1;
   _menu.imageOffset = CGSizeMake(5, -1);
   _menu.waitUntilAnimationIsComplete = NO;
   
   
	// Do any additional setup after loading the view.
}

- (void)toggleMenu
{
   if (_menu.isOpen)
      return [_menu close];
   
   [_menu showFromNavigationController:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
