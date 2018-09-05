//
//  Manager.m
//  PizzaRestaurant
//
//  Created by paula on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Manager.h"
#import "Kitchen.h"
#import "Pizza.h"

@implementation Manager

- (BOOL)kitchen:(Kitchen *) kitchen
shouldMakePizzaOfSize:(PizzaSize) size
    andToppings:(NSArray *) toppings{
    return !([toppings containsObject:@"anchovies"]);
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *) kitchen{
    return NO;
}

@end
