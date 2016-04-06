//
//  TodoViewKIFTests.m
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface TodoViewKIFTests : XCTestCase

@end

@implementation TodoViewKIFTests

- (void)setUp
{
    [super setUp];

    [tester tapViewWithAccessibilityLabel:@"Learn KIF 0"];
    [tester waitForViewWithAccessibilityLabel:@"Description: Learn KIF"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAlertPopup
{
    [tester tapViewWithAccessibilityLabel:@"Done"];
    [tester waitForViewWithAccessibilityLabel:@"..you are done with Learn KIF?"];

    // teardown:
    [tester tapViewWithAccessibilityLabel:@"Cancel"];
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"tableView"];
}

- (void)testAlertPopupAndPressOK
{
    [tester tapViewWithAccessibilityLabel:@"Done"];
    [tester tapViewWithAccessibilityLabel:@"OK"];

    [tester waitForViewWithAccessibilityLabel:@"tableView"];
}

- (void)testAlertPopupAndPressCancel
{
    [tester tapViewWithAccessibilityLabel:@"Done"];
    [tester tapViewWithAccessibilityLabel:@"Cancel"];

    [tester waitForViewWithAccessibilityLabel:@"Description: Learn KIF"];

    // teardown:
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"tableView"];
}

@end
