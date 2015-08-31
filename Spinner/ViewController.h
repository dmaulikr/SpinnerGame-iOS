//
//  ViewController.h
//  Spinner
//
//  Created by Vadim Brodsky on 2013/10/09.
//  Copyright (c) 2013年 Vadims Brodskis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Components.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *seedField;
@property (strong, nonatomic) IBOutlet Components *spinner;
- (IBAction)onDismissKeyboard:(id)sender;
- (IBAction)onGameStart:(id)sender;
- (IBAction)onReset:(id)sender;



-(void) handleBackgroundTap: (UITapGestureRecognizer*) sender;

@end
