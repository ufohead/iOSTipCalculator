//
//  ViewController.m
//  Tipd
//
//  Created by Ufohead Tseng on 2015/5/14.
//  Copyright (c) 2015年 Ufohead Tseng. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

AppDelegate *appdelegate;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    [self.tipPercent setTitle:appdelegate.segmentData1 forSegmentAtIndex:0];
    [self.tipPercent setTitle:appdelegate.segmentData2 forSegmentAtIndex:1];
    [self.tipPercent setTitle:appdelegate.segmentData3 forSegmentAtIndex:2];
    [self.tipPercent setTitle:appdelegate.segmentData4 forSegmentAtIndex:3];
    [self.tipPercent setTitle:appdelegate.segmentData5 forSegmentAtIndex:4];
    
    [self displayTheKeyboard];
}

- (void)displayTheKeyboard
{
    [self.billAmount becomeFirstResponder];
}

- (void)dismissTheKeyboard
{
    [self.billAmount resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tipPercentChanged:(id)sender {
    
}

- (IBAction)tipPercentCanged:(UISegmentedControl *)sender {
    //NSLog(@"tip percent changed: %ld", (long)sender.selectedSegmentIndex);
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self updateSharedTotal];
    [self dismissTheKeyboard];
}
- (IBAction)perPersonsChanged:(UISegmentedControl *)sender {
    [self updateDisplayedTip];
    [self updateDisplayedTotal];
    [self updateSharedTotal];
    [self dismissTheKeyboard];
}

- (NSString *)formatCurrency:(float)amount {
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    nf.numberStyle = NSNumberFormatterCurrencyStyle;
    NSNumber *number = [NSNumber numberWithFloat:amount];
    return [nf stringFromNumber:number];
}


- (void)displayTotalAmount:(float)amount {

    self.billAmount.text = [self formatCurrency:amount];
}

- (void)displayTipAmount:(float)amount {
    
    self.tipAmount.text = [self formatCurrency:amount];
}

- (float)calculateTipPercentageForSegment:(int)segment {
    NSString *tipText = [self.tipPercent titleForSegmentAtIndex:segment];
    return [tipText floatValue] / 100.0;
}

- (float)getBillAmount {
    return [self.billAmount.text floatValue];
}

- (float)calculateTipAmount:(float)amount percent:(float)percent {
    return amount * percent;
}

- (void)updateDisplayedTip {
    float amount = [self getBillAmount];
    int segment = (int)self.tipPercent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    self.tipAmount.text = [self formatCurrency:tip];
}

-(float)countingTotal {
    float amount = [self getBillAmount];
    int segment = (int)self.tipPercent.selectedSegmentIndex;
    float percent = [self calculateTipPercentageForSegment:segment];
    float tip = [self calculateTipAmount:amount percent:percent];
    return (tip+amount);
}

- (void)updateDisplayedTotal {
    float result = [self countingTotal];
    self.totalAmount.text = [self formatCurrency:result];
}

- (void)updateSharedTotal {
    float result = [self countingTotal];
    int numbers = (int)self.perPersons.selectedSegmentIndex;
    //NSLog(@"Numbers: %i, Persons: %i",numbers,persons);
    self.sharedAmount.text = [self formatCurrency:(result)/(numbers+2)];
}

@end
