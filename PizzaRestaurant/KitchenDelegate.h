//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by paula on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "Kitchen.h"

@interface KitchenDelegate : NSDeleteCommand

- (BOOL)kitchen:(Kitchen *) kitchen
shouldMakePizzaOfSize:(PizzaSize) size
    andToppings:(NSArray *) toppings;

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *) kitchen;

- (void)kitchenDidMakePizza:(Pizza *) pizza;

@end
