//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Manager.h"
#import "NiceManager.h"
#import "PizzaUtils.h"

int getPizzaSizeByNSString(NSString *size);
NSString* getPizzaSize(int size);
void printPizza(Pizza *pizza);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Kitchen *restaurantKitchen = [Kitchen new];
        Pizza *pizza;
        Manager *manager = nil;
        NiceManager *niceManager = nil;
        PizzaUtils *pizzaUtils = [[PizzaUtils alloc] init];
        NSString *option = @"";
        NSInteger managerOption;
        
        while (![option isEqualToString:@"quit"]) {
            NSLog(@"\n1 - Manager\n2 - Nice Manager\n3 - No Manager\n4 - Delivered Pizzas\n5 - Quit\n");
            char strM[10];
            fgets (strM, 10, stdin);
            NSString *inputManager = [[NSString alloc] initWithUTF8String:strM];
            managerOption = [[inputManager stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] integerValue];
            
            if(managerOption == 1){
                if(!manager){
                    manager = [[Manager alloc] init];
                }
                restaurantKitchen.kitchenDelegate = manager;
            }else if(managerOption == 2){
                if(!niceManager){
                    niceManager = [[NiceManager alloc] initWithDeliveryService];
                }
                restaurantKitchen.kitchenDelegate = niceManager;
            }else{
                restaurantKitchen.kitchenDelegate = nil;
            }
            
            if(managerOption == 4){
                NSArray *pizzas = [[niceManager delivery] pizzasDelivered];
                NSMutableString *strPizzas = [[NSMutableString alloc] init];
                
                for(int i = 0; i < [pizzas count]; i++){
                    [strPizzas appendFormat:@"%@\n", [pizzas objectAtIndex:i]];
                }
                NSLog(@"\nPizzas delivered:\n%@", strPizzas);
            }else if(managerOption == 5){
                option = @"quit";
                NSLog(@"\nBye bye! =D");
            }else{
                NSLog(@"Please pick your pizza size and toppings:");
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
                
                // To order mozzarella or tuna -> just put "tuna" or "mozzarella"
                // To order pepperoni -> choose the size and write "pepperoni" like this: "small pepperoni"
                // This commands make pizzas without a manager
                if([option isEqualToString:@"mozzarella"] && [sizeCommand isEqualToString:@""]){
                    pizza = [restaurantKitchen makeMozzarellaPizza];
                    [pizzaUtils printPizza:pizza];
                }else if([option isEqualToString:@"tuna"]  && [sizeCommand isEqualToString:@""]){
                    pizza = [restaurantKitchen makeTunaPizza];
                    [pizzaUtils printPizza:pizza];
                }else if([option isEqualToString:@"pepperoni"] && ![sizeCommand isEqualToString:@""]){
                    pizza = [restaurantKitchen makePepperoniPizzaWithSize:getPizzaSizeByNSString(sizeCommand)];
                    [pizzaUtils printPizza:pizza];
                }else if(![option isEqualToString:@"quit"] && ![sizeCommand isEqualToString:@""]){
                    // Order pizza using size and a list of toppings with or without a manager
                    pizza = [restaurantKitchen makePizzaWithSize:getPizzaSizeByNSString(sizeCommand) toppings:mutableCommands];
                    [pizzaUtils printPizza:pizza];
                }else if([option isEqualToString:@"quit"]){
                    NSLog(@"\nBye bye! =D");
                }else{
                    NSLog(@"\nIncorrect Command!");
                }
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
