//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by paula on 2018-08-23.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pizza : NSObject

typedef enum pizzaSizeTypes
{
    SMALL,
    MEDIUM,
    LARGE
} PizzaSizes;

@property PizzaSizes *pizzaSize;
@property NSArray <NSString *> *toppings;

- (id)initWithSize:(PizzaSizes *)size
          toppings:(NSArray <NSString *> *) aToppings;

- (float)pizzaValueBySize:(PizzaSizes *)size;

- (NSArray <NSString *> *)getToppings;

@end
