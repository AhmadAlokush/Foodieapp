//
//  NavigationViewController.h
//  Foodieapp
//
//  Created by AHMAD on 5/20/13.
//  Copyright (c) 2013 Ahmadeus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REMenu.h"

@interface NavigationViewController : UINavigationController
@property (strong, readonly, nonatomic) REMenu *menu;

- (void)toggleMenu;

@end
