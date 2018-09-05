//
//  PizzaUtils.m
//  PizzaRestaurant
//
//  Created by paula on 2018-09-04.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "PizzaUtils.h"
#import "Pizza.h"

@implementation PizzaUtils

- (NSString*) getPizzaSize:(int) size{
    switch (size) {
        case small:
            return @"small";
        case medium:
            return @"medium";
        case large:
            return @"large";
        default:
            return @"";
    }
}

- (NSString *)getPizzaDescription:(Pizza *)pizza{
    NSMutableString *pizzaDescription = [[NSMutableString alloc] init];
    [pizzaDescription appendFormat:@"%@ pizza with ", [self getPizzaSize:pizza.pizzaSize]];
    
    if([pizza.toppings count] == 0){
        [pizzaDescription appendString:@"no topping "];
    }else{
        for(int topIndex = 0; topIndex < [pizza.toppings count]; topIndex++){
            [pizzaDescription appendString:[pizza.toppings objectAtIndex:topIndex]];
            
            if(topIndex == [pizza.toppings count]-2){
                [pizzaDescription appendString:@" and "];
            }else if(topIndex == [pizza.toppings count]-1){
                [pizzaDescription appendString:@" "];
            }else{
                [pizzaDescription appendString:@", "];
            }
        }
    }
    return pizzaDescription;
}

- (void) printPizza:(Pizza *)pizza{
    if(pizza){
        NSMutableString *pizzaMade = [[NSMutableString alloc] init];
        [pizzaMade appendString:@"\nA "];
        
        [pizzaMade appendFormat:@"%@was made.", [self getPizzaDescription:pizza]];
        
        NSLog(@"%@", pizzaMade);
    }else{
        NSLog(@"\nNo pizza was made.");
    }
}

@end
