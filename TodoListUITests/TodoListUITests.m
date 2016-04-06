//
//  TodoListUITests.m
//  TodoListUITests
//
//  Created by David Horvath on 06/04/16.
//  Copyright © 2016 Supercharge Kft. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TodoListUITests : XCTestCase

@end

@implementation TodoListUITests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddNewItem
{
    self.continueAfterFailure = NO;
    [[[XCUIApplication alloc] init] launch];

    XCUIApplication *app = [XCUIApplication new];
    [app.navigationBars[@"Todos"].buttons[@"Add"] tap];

    XCTAssertEqual(app.tables.cells.count, 4);
}

- (void)testScrollToItem
{
    XCUIApplication *app = [XCUIApplication new];

    for (int i = 0; i <= 13; ++i)
    {
        [app.navigationBars[@"Todos"].buttons[@"Add"] tap];
    }

    XCTAssertEqual(app.tables.cells.count, 18);

    XCUIElement *tableviewTable = app.tables[@"tableView"];
    [tableviewTable.cells[@"Anything else? 17"] swipeUp];
    [tableviewTable.cells[@"Anything else? 17"] tap];

    [app.navigationBars.buttons[@"Back"] tap];

    NSPredicate *exists = [NSPredicate predicateWithFormat:@"exists == 1"];
    [self expectationForPredicate:exists evaluatedWithObject:tableviewTable handler:nil];
    [self waitForExpectationsWithTimeout:5 handler:nil];

}

- (void)testSwipe
{
    XCUIApplication *app = [[XCUIApplication alloc] init];

    XCUIElement *tableviewTable = app.tables[@"tableView"];
    [tableviewTable.cells[@"Anything else? 17"] swipeLeft];
    [tableviewTable.buttons[@"Delete"] tap];
    //
    XCTAssertEqual(app.tables.cells.count, 17);
}

@end
