//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by paula on 2018-08-23.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pizza : NSObject

typedef enum
{
    small,
    medium,
    large
} PizzaSize;

@property PizzaSize pizzaSize;
@property NSArray <NSString *> *toppings;

- (id)initWithSize:(PizzaSize)size
          toppings:(NSArray <NSString *> *) aToppings;

+ (Pizza *)largeMozzarella;

+ (Pizza *)largeTuna;

+ (Pizza *)pepperoniWithSize:(PizzaSize)size;

- (float)pizzaValueBySize:(PizzaSize)size;

- (NSArray <NSString *> *)getToppings;

@end
