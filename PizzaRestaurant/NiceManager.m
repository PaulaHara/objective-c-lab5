//
//  NiceManager.m
//  PizzaRestaurant
//
//  Created by paula on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "NiceManager.h"
#import "Pizza.h"
#import "Kitchen.h"

@implementation NiceManager

- (id)initWithDeliveryService{
    self = [super init];
    if(self){
        self.delivery = [[DeliveryService alloc] initWithDeliveryCarAndPizzas];
    }
    return self;
}

- (BOOL)kitchen:(Kitchen *) kitchen
shouldMakePizzaOfSize:(PizzaSize) size
    andToppings:(NSArray *) toppings{
    return YES;
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *) kitchen{
    return YES;
}

- (void)kitchenDidMakePizza:(Pizza *) pizza{
    NSLog(@"\nThanks for ordering with us!\nHave a nice day!\n");
    [_delivery deliverPizza:pizza];
}

@end
