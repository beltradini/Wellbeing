//
//  ConsentTaskBuilderTests.m
//  WellbeingTests
//
//  Created by Alejandro Beltrán on 1/25/26.
//

#import <XCTest/XCTest.h>
#import "ConsentTaskBuilder.h"

@interface ConsentTaskBuilderTests : XCTestCase
@end

@implementation ConsentTaskBuilderTests

- (void)testBuildConsentTaskReturnsTask {
    ORKOrderedTask *task = [ConsentTaskBuilder buildConsentTask];
    XCTAssertNotNil(task, @"El método buildConsentTask no debe retornar nil");
    XCTAssertTrue([task.identifier isEqualToString:@"ConsentTask"], @"El identificador de la tarea debe ser 'ConsentTask'");
}

- (void)testConsentTaskHasTwoSteps {
    ORKOrderedTask *task = [ConsentTaskBuilder buildConsentTask];
    XCTAssertEqual(task.steps.count, 2, @"La tarea de consentimiento debe contener dos pasos (visual y revisión)");
}

- (void)testConsentDocumentHasSectionAndSignature {
    ORKOrderedTask *task = [ConsentTaskBuilder buildConsentTask];
    ORKStep *visualStep = task.steps.firstObject;

    XCTAssertTrue([visualStep isKindOfClass:[ORKVisualConsentStep class]], @"El primer paso debe ser ORKVisualConsentStep");

    ORKConsentDocument *doc = ((ORKVisualConsentStep *)visualStep).document;
    XCTAssertNotNil(doc, @"El documento de consentimiento no debe ser nil");
    XCTAssertEqual(doc.sections.count, 1);
    XCTAssertEqual(doc.signatures.count, 1);
    XCTAssertTrue([doc.title isEqualToString:@"Wellbeing Research Study"]);
}

@end
