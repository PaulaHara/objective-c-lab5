//
//  DeliveryCar.m
//  PizzaRestaurant
//
//  Created by paula on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "DeliveryCar.h"
#import "Pizza.h"

@implementation DeliveryCar

- (void)deliverPizza:(Pizza *)pizza{
    if(pizza){
        NSLog(@"\nPizza Delivered.");
    }
}

@end
