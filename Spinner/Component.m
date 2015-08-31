//
//  Component.m
//  Spinner
//
//  Created by Vadim Brodsky on 2013/10/09.
//  Copyright (c) 2013年 Vadims Brodskis. All rights reserved.
//

#import "Component.h"

@implementation Component

@synthesize values;

-(Component *) initArray {
    self = [super init];
    if (self) {
        values = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    }
    return self;
}



@end
