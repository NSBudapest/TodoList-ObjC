//
//  TodoTableViewKIFTests.m
//  TodoList
//
//  Created by David Horvath on 31/03/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <KIF/KIF.h>

@interface TodoTableViewKIFTests : XCTestCase

@end

@implementation TodoTableViewKIFTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAddNewItem
{
    [tester tapViewWithAccessibilityLabel:@"Add"];

    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"tableView"];
    [tester waitForCellAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0] inTableView:tableView];

    NSInteger numberOfRows = [tableView numberOfRowsInSection:0];
    XCTAssertEqual(numberOfRows, 4);
}

- (void)testScrollToItem
{
    for (int i = 0; i <= 13; ++i)
    {
        [tester tapViewWithAccessibilityLabel:@"Add"];
    }

    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"tableView"];
    [tester waitForCellAtIndexPath:[NSIndexPath indexPathForRow:12 inSection:0] inTableView:tableView];

    NSInteger numberOfRows = [tableView numberOfRowsInSection:0];
    XCTAssertEqual(numberOfRows, 18);

    [tester tapViewWithAccessibilityLabel:@"Anything else? 17"];

    // go back
    [tester tapViewWithAccessibilityLabel:@"Back"];
    [tester waitForViewWithAccessibilityLabel:@"tableView"];
}

- (void)testSwipe
{
    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"tableView"];
    [tester swipeRowAtIndexPath:[NSIndexPath indexPathForRow:10 inSection:0]
                    inTableView:tableView
                    inDirection:KIFSwipeDirectionLeft];
    [tester tapViewWithAccessibilityLabel:@"Delete"];

    NSInteger numberOfRows = [tableView numberOfRowsInSection:0];
    XCTAssertEqual(numberOfRows, 17);
}

@end
