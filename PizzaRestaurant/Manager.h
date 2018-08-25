//
//  Manager.h
//  PizzaRestaurant
//
//  Created by paula on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KitchenDelegate;

@interface Manager : NSObject

@property (nonatomic, weak) id<KitchenDelegate> delegate;

@end
