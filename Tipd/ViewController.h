//
//  ViewController.h
//  Tipd
//
//  Created by Ufohead Tseng on 2015/5/14.
//  Copyright (c) 2015年 Ufohead Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *billAmount;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercent;

@property (weak, nonatomic) IBOutlet UITextField *tipAmount;

@property (weak, nonatomic) IBOutlet UITextField *totalAmount;

@property (weak, nonatomic) IBOutlet UITextField *sharedAmount;

@property (weak, nonatomic) IBOutlet UISegmentedControl *perPersons;


- (IBAction)tipPercentCanged:(UISegmentedControl *)sender;

- (void)displayTotalAmount:(float)amount;

- (void)displayTipAmount:(float)amount;

- (float)calculateTipPercentageForSegment:(int)segment;

- (float)getBillAmount;

- (float)calculateTipAmount:(float)amount percent:(float)percent;

- (void)updateDisplayedTip;

- (void)updateDisplayedTotal;

@end

