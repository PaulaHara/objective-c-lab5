//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by paula on 2018-08-23.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (id)initWithSize:(PizzaSize) size
          toppings:(NSArray <NSString *> *) aToppings{
    self = [super init];
    if(self){
        self.pizzaSize = size;
        self.toppings = aToppings;
    }
    return self;
}

+ (Pizza *)largeMozzarella{
    return [[Pizza alloc] initWithSize:large toppings:[NSArray arrayWithObjects:@"mozzarella", @"olives", nil]];
}

+ (Pizza *)largeTuna{
    return [[Pizza alloc] initWithSize:large toppings:[NSArray arrayWithObjects:@"tuna", @"cheese", @"onions", nil]];
}

+ (Pizza *)pepperoniWithSize:(PizzaSize) size{
    return [[Pizza alloc] initWithSize:size toppings:[NSArray arrayWithObjects:@"pepperoni", @"cheese", @"tomatos", @"onions", nil]];
}

- (float)pizzaValueBySize:(PizzaSize) size{
    switch(size){
        case small:
            return 12.2;
        case medium:
            return 15.8;
        case large:
            return 22.5;
        default:
            break;
    }
}

- (NSArray <NSString *> *) getToppings{
    return self.toppings;
}

@end
