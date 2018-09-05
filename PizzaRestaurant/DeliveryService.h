//
//  DeliveryService.h
//  PizzaRestaurant
//
//  Created by paula on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "DeliveryCar.h"
#import "PizzaUtils.h"

@interface DeliveryService : NSObject

@property NSMutableArray *pizzas;
@property DeliveryCar *deliveryCar;
@property PizzaUtils *pizzaUtils;

- (id)initWithDeliveryCarAndPizzas;

- (void)deliverPizza:(Pizza *)pizza;

- (NSArray *)pizzasDelivered;

@end
