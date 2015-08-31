//
//  Components.h
//  Spinner
//
//  Created by 11303765 on 22/10/13.
//  Copyright (c) 2013 Vadims Brodskis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"

@interface Components : NSObject

@property (strong, nonatomic) NSArray *components;

-(void) moveComponent: (int) current toRow: (int) newCurrentIndex inPicker: (UIPickerView*) picker;
-(void) reset;

@end
