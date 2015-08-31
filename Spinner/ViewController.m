//
//  ViewController.m
//  Spinner
//
//  Created by Vadim Brodsky on 2013/10/09.
//  Copyright (c) 2013年 Vadims Brodskis. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

@synthesize picker, seedField, spinner;

// array used to remember the previous index of each component


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.spinner = [[Components alloc] init];
    UITapGestureRecognizer* tapRecogniser = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self
                                             action:@selector(handleBackgroundTap:)];
    tapRecogniser.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecogniser];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [spinner.components count];
}

- (NSInteger) pickerView:(UIPickerView *)pickerView
                        numberOfRowsInComponent:(NSInteger)component
{
    return [[spinner.components objectAtIndex:component] count];
}

- (NSString*) pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[spinner.components objectAtIndex:component] objectAtIndex:row];
}

-(void) handleBackgroundTap: (UITapGestureRecognizer*) sender
{
    [seedField resignFirstResponder];
}

-(void)pickerView:(UIPickerView *)pickerView
     didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    [spinner moveComponent:component toRow:row inPicker: picker];
    
    //  When solved display Alert View with congradulation message and reset the game.
    if ([self currentAllOnes]){
        UIAlertView* message = [[UIAlertView alloc]
                                initWithTitle:@""
                                message:@"You have solved Slider"
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil, nil];
        [message show];
    }
    
}
- (IBAction)onDismissKeyboard:(id)sender
{
    [seedField resignFirstResponder];
}

-(bool) currentAllOnes          // Win condition check
{
    for (int i=0; i<[spinner.components count]; i++)
        if ([picker selectedRowInComponent:i]!=0) return false;
    return true;
}

- (IBAction)onGameStart:(id)sender
{
    [seedField resignFirstResponder];
    int rand_num = 0;
    if ([seedField.text length]> 0){
        [self resetPicker];
        int seed = [seedField.text intValue];
        srandom(seed);
        seedField.text=@"";
        // randomise each component of picker based on random number from the seed.
        for (int i=0; i<[spinner.components count]; i++){
            rand_num = random() % [spinner.components count];
            [spinner moveComponent: i toRow:rand_num inPicker: picker];
        }
    }
    else{
        UIAlertView* message = [[UIAlertView alloc]
                                initWithTitle:@"Warning"
                                message:@"You must enter a seed value before starting spinner"
                                delegate:nil
                                cancelButtonTitle:@"OK"
                                otherButtonTitles:nil, nil];
        [message show];
    }
}

- (IBAction)onReset:(id)sender {
    [self resetPicker];
}


-(void) resetPicker            // reset game
{
    [picker reloadAllComponents];
    for (int i=0; i<[spinner.components count]; i++) {
        [picker selectRow:0 inComponent:i animated:YES];
        [spinner reset];
        
    }
}



@end
