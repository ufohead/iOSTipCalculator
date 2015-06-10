//
//  ViewController2.m
//  Tipd
//
//  Created by Ufohead Tseng on 2015/6/10.
//  Copyright (c) 2015年 Ufohead Tseng. All rights reserved.
//

#import "ViewController2.h"
#import "AppDelegate.h"

//#define SharedAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

@interface ViewController2 ()

@end

@implementation ViewController2

AppDelegate *appdelegate2;

- (void)viewDidLoad {
    [super viewDidLoad];

    
    appdelegate2 = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    //appdelegate.segmentData1 = @"10%";
    // Do any additional setup after loading the view.
//    [SharedAppDelegate segmentData1]
    
    //NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSString *stringValue = [defaults objectForKey:@"key1"];
    //int intValue = (int)[defaults integerForKey:@"key2"];
    self.Segmet1.text =  appdelegate2.segmentData1;
    self.Segmet2.text =  appdelegate2.segmentData2;
    self.Segmet3.text =  appdelegate2.segmentData3;
    self.Segmet4.text =  appdelegate2.segmentData4;
    self.Segmet5.text =  appdelegate2.segmentData5;

    
}
- (IBAction)segment1Changed:(UITextField *)sender {
    appdelegate2.segmentData1 = self.Segmet1.text;
}
- (IBAction)segment2Changed:(UITextField *)sender {
    appdelegate2.segmentData2 = self.Segmet2.text;
}
- (IBAction)segment3Changed:(UITextField *)sender {
    appdelegate2.segmentData3 = self.Segmet3.text;
}
- (IBAction)segment4Changed:(UITextField *)sender {
    appdelegate2.segmentData4 = self.Segmet4.text;
}
- (IBAction)segment5Changed:(UITextField *)sender {
    appdelegate2.segmentData5 = self.Segmet5.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
