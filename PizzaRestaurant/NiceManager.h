//
//  NiceManager.h
//  PizzaRestaurant
//
//  Created by paula on 2018-08-24.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeliveryService.h"

@protocol KitchenDelegate;

@interface NiceManager : NSObject

@property (nonatomic, weak) id<KitchenDelegate> delegate;
@property DeliveryService *delivery;

- (id)initWithDeliveryService;

@end
