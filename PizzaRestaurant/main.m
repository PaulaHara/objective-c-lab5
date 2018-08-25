//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"

int getPizzaSizeByNSString(NSString *size);
NSString* getPizzaSize(int size);
void printPizza(Pizza *pizza);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        Pizza *pizza;
        NSString *option = @"";
        
        while (![option isEqualToString:@"quit"]) {
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSMutableArray *mutableCommands = [commandWords mutableCopy];
            NSString *sizeCommand = @"";
            
            if([commandWords count] == 1){
                option = [mutableCommands firstObject];
            }else if([commandWords count] > 1){
                sizeCommand = [mutableCommands firstObject];
                [mutableCommands removeObjectAtIndex:0];
                if([commandWords count] == 2){
                    option = [mutableCommands firstObject];
                }else{
                    option = @"";
                }
            }
            
            if([option isEqualToString:@"mozzarella"] && [sizeCommand isEqualToString:@""]){
                pizza = [restaurantKitchen makeMozzarellaPizza];
                printPizza(pizza);
            }else if([option isEqualToString:@"tuna"]  && [sizeCommand isEqualToString:@""]){
                pizza = [restaurantKitchen makeTunaPizza];
                printPizza(pizza);
            }else if([option isEqualToString:@"pepperoni"]){
                pizza = [restaurantKitchen makePepperoniPizzaWithSize:getPizzaSizeByNSString(sizeCommand)];
                printPizza(pizza);
            }else if(![option isEqualToString:@"quit"]){
                // And then send some message to the kitchen...
                pizza = [restaurantKitchen makePizzaWithSize:getPizzaSizeByNSString(sizeCommand) toppings:mutableCommands];
                printPizza(pizza);
            }
        }
    }
    return 0;
}

int getPizzaSizeByNSString(NSString *size){
    if([size isEqualToString:@"small"]){
        return small;
    }else if([size isEqualToString:@"medium"]){
        return medium;
    }else{
        return large;
    }
}

NSString* getPizzaSize(int size){
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

void printPizza(Pizza *pizza){
    NSMutableString *pizzaMade = [[NSMutableString alloc] init];
    [pizzaMade appendFormat:@"\nA %@ pizza with ", getPizzaSize(pizza.pizzaSize)];
    
    if([pizza.toppings count] == 0){
        [pizzaMade appendString:@"no topping "];
    }else{
        for(int topIndex = 0; topIndex < [pizza.toppings count]; topIndex++){
            [pizzaMade appendString:[pizza.toppings objectAtIndex:topIndex]];
            
            if(topIndex == [pizza.toppings count]-2){
                [pizzaMade appendString:@" and "];
            }else if(topIndex == [pizza.toppings count]-1){
                [pizzaMade appendString:@" "];
            }else{
                [pizzaMade appendString:@", "];
            }
        }
    }
    
    [pizzaMade appendString:@"was made."];
    
    NSLog(@"%@", pizzaMade);
}
