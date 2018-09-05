//
//  PizzaUtils.h
//  PizzaRestaurant
//
//  Created by paula on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"

@interface PizzaUtils : NSObject

- (NSString*) getPizzaSize:(int) size;

- (NSString *)getPizzaDescription:(Pizza *)pizza;

- (void) printPizza:(Pizza *)pizza;

@end
