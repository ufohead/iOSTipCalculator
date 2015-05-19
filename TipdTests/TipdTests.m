//
//  TipdTests.m
//  TipdTests
//
//  Created by Ufohead Tseng on 2015/5/14.
//  Copyright (c) 2015年 Ufohead Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"


@interface TipdTests : XCTestCase

@property (strong, nonatomic) ViewController *vc;

@end

@implementation TipdTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateInitialViewController];
    [self.vc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatVCInstantiates {
    XCTAssertNotNil(self.vc);
    //XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testDisplayTotalAmountFor0 {
    [self.vc displayTotalAmount:0];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
}

- (void)testDisplayTotalAmountFor123 {
    [self.vc displayTotalAmount:123.00];
    NSString *result = self.vc.billAmount.text;
    XCTAssertEqualObjects(result, @"$123.00");
}

- (void)testDisplayTipAmountFor0 {
    [self.vc displayTipAmount:0];
    NSString *result = self.vc.tipAmount.text;
    XCTAssertEqualObjects(result, @"$0.00");
}

- (void)testDisplayTipAmountFor45 {
    [self.vc displayTipAmount:45];
    NSString *result = self.vc.tipAmount.text;
    XCTAssertEqualObjects(result, @"$45.00");
}

- (void)testCalculateTipPercentForSegment0 {
    float percent = [self.vc calculateTipPercentageForSegment:0];
    XCTAssertEqualWithAccuracy(percent, 0.05, 0.001, @"Expected percent %f should be 0.05", percent);
}

- (void)testCalculateTipPercentForSegment3 {
    float percent = [self.vc calculateTipPercentageForSegment:3];
    XCTAssertEqualWithAccuracy(percent, 0.20, 0.001, @"Expected percent %f should be 0.20", percent);
}

- (void)testGetBillAmountWhenBlank {
    self.vc.billAmount.text = @"";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 0.0, 0.001);
}

- (void)testGetBillAmountFor12point34 {
    self.vc.billAmount.text = @"12.34";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}

- (void)testGetBillAmountFor12point34point56 {
    self.vc.billAmount.text = @"12.34.56";
    float result = [self.vc getBillAmount];
    XCTAssertEqualWithAccuracy(result, 12.34, 0.001);
}

- (void)testCalulateTipAmount {
    float tip = [self.vc calculateTipAmount:12.34 percent:0.10];
    XCTAssertEqualWithAccuracy(tip, 1.23, 0.05);
}

- (void)testUpdateDisplayedTipForZero {
    self.vc.billAmount.text = @"0";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$0.00");
}

- (void)testUpdateDisplayedTipFor10by10 {
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$1.00");
}

- (void)testUpdateDisplayedTipFor10by15 {
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 2;
    [self.vc updateDisplayedTip];
    NSString *tipString = self.vc.tipAmount.text;
    XCTAssertEqualObjects(tipString, @"$1.50");
}

- (void)testUpdateDisplayedTotalForZero {
    self.vc.billAmount.text = @"0";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *totalString = self.vc.totalAmount.text;
    XCTAssertEqualObjects(totalString, @"$0.00");
}


- (void)testUpdateDisplayedTotalFor10by10 {
    self.vc.billAmount.text = @"10.00";
    self.vc.tipPercent.selectedSegmentIndex = 1;
    [self.vc updateDisplayedTotal];
    NSString *totalString = self.vc.totalAmount.text;
    XCTAssertEqualObjects(totalString, @"$11.00");
}

@end
