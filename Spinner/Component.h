//
//  Component.h
//  Spinner
//
//  Created by Vadim Brodsky on 2013/10/09.
//  Copyright (c) 2013年 Vadims Brodskis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Component : NSObject

@property (strong, nonatomic) NSArray *values;

-(Component *) initArray;

@end
