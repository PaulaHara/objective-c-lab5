//
//  DeliveryService.m
//  PizzaRestaurant
//
//  Created by paula on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DeliveryService.h"
#import "PizzaUtils.h"

@implementation DeliveryService

- (id)initWithDeliveryCarAndPizzas{
    self = [super init];
    if(self){
        self.deliveryCar = [[DeliveryCar alloc] init];
        self.pizzas = [[NSMutableArray alloc] init];
        self.pizzaUtils = [[PizzaUtils alloc] init];
    }
    return self;
}

- (void)deliverPizza:(Pizza *)pizza{
    [self.pizzas addObject:[_pizzaUtils getPizzaDescription:pizza]];
    
    [_deliveryCar deliverPizza:pizza];
}

- (NSArray *)pizzasDelivered{
    return _pizzas;
}

@end
