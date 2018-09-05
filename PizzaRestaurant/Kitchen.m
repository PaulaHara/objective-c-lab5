//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"
#import "Pizza.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings
{
    Pizza *pizza = nil;
    if(_kitchenDelegate){
        if([_kitchenDelegate kitchen:self shouldMakePizzaOfSize:size andToppings:toppings]){
            if([_kitchenDelegate kitchenShouldUpgradeOrder:self]){
                size = large;
            }
            pizza = [[Pizza alloc] initWithSize:size toppings:toppings];
            
            if([_kitchenDelegate respondsToSelector:@selector(kitchenDidMakePizza:)]){
                [_kitchenDelegate kitchenDidMakePizza:pizza];
            }
        }
    }else{
        pizza = [[Pizza alloc] initWithSize:size toppings:toppings];
    }
    return pizza;
}

- (Pizza *)makeMozzarellaPizza{
    return [Pizza largeMozzarella];
}

- (Pizza *)makeTunaPizza{
    return [Pizza largeTuna];
}

- (Pizza *)makePepperoniPizzaWithSize:(PizzaSize)size{
    return [Pizza pepperoniWithSize:size];
}

@end
