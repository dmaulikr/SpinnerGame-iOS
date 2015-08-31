//
//  Components.m
//  Spinner
//
//  Created by 11303765 on 22/10/13.
//  Copyright (c) 2013 Vadims Brodskis. All rights reserved.
//

#import "Components.h"

@implementation Components

@synthesize components;

int previouSelectedIndex[] = {0,0,0,0,0};

-(id) init{
    self = [super init];
    if (self){
        for (int i=0; i<[components count]; i++)
            previouSelectedIndex[i] = 0;
        
        components = @[ [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil],
                                  [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil],
                                  [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil],
                                  [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil],
                                  [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5", nil] ];
    }
    return self;
}


-(void) moveComponent: (int) current toRow: (int) newCurrentIndex inPicker: (UIPickerView*) picker
{
    int prev = [self findPrev:current];
    int next = [self findNext:current];
    int difference = newCurrentIndex-previouSelectedIndex[current];;
    int prevIndex = [picker selectedRowInComponent:prev];
    int nextIndex = [picker selectedRowInComponent:next];
    
    // determine what the next and previous components need to change to.
    int newPrevIndex = [self findComponentIndex:prevIndex fromDifference:difference];
    int newNextIndex = [self findComponentIndex:nextIndex fromDifference:difference];
    
    [picker selectRow:newPrevIndex inComponent: prev animated:YES];
    [picker selectRow:newCurrentIndex inComponent:current animated:YES];
    [picker selectRow:newNextIndex inComponent: next animated:YES];
    
    // update the prev indexes of all 3 components that were changed
    previouSelectedIndex[current] = newCurrentIndex;
    previouSelectedIndex[next] = newNextIndex;
    previouSelectedIndex[prev] = newPrevIndex;
}

-(int) findComponentIndex: (int) oldIndex fromDifference: (int) diference
{
    int newIndex = oldIndex;
    
    if (diference > 0)
        for (int i=0; i<diference; i++)
            newIndex = [self findNext:newIndex];
    else
        for (int i=0; i<diference*-1; i++)
            newIndex = [self findPrev:newIndex];
    return newIndex;
}

-(int) findNext: (int) current          // wrap around from 5 to 1
{
    int next = current;
    
    if (current == [components count]-1)
        next = 0;
    else
        next++;
    return next;
}

-(int) findPrev: (int) current          // wrap arround from 1 to 5
{
    int prev = current;
    
    if (current == 0)
        prev = [components count]-1;
    else
        prev--;
    return prev;
}

-(void) reset{
    for (int i=0; i< [components count]; i++)
        previouSelectedIndex[i]=0;
}

@end
