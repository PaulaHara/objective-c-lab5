//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by paula on 2018-08-23.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"

@implementation Pizza

- (id)initWithSize:(PizzaSizes *)size
          toppings:(NSArray <NSString *> *) aToppings{
    self = [super init];
    if(self){
        self.pizzaSize = size;
        self.toppings = aToppings;
    }
    return self;
}

- (float)pizzaValueBySize:(PizzaSizes *)size{
    return 2.3;
}

- (NSArray <NSString *> *)getToppings{
    return self.toppings;
}

@end
