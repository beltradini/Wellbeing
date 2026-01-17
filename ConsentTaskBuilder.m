//
//  ConsentTaskBuilder.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "ConsentTaskBuilder.h"

@implementation ConsentTaskBuilder

+ (ORKOrderedTask *)buildConsentTask {
    
    ORKConsentDocument *document = [[ORKConsentDocument alloc] init];
    document.title = @"Wellbeing Research Study";
    
    ORKConsentSection *overview = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeOverview];
    overview.summary = @"This study collects daily wellbeing data.";
    overview.content = @"Your participation is voluntary.";
    
    document.sections = @[overview];
    
    ORKConsentSignature *signature = [ORKConsentSignature signatureForPersonWithTitle:nil dateFormatString:nil identifier:@"UserSignature"];
    
    document.signatures = @[signature];
    
    ORKInstructionStep *visualStep = [[ORKInstructionStep alloc] initWithIdentifier:@"VisualConsent"];
    visualStep.consentDocument = document;
    
    ORKConsentReviewStep *reviewStep = [[ORKConsentReviewStep alloc] initWithIdentifier:@"ConsentReview" signature:signature inDocument:document];
    
    return [[ORKOrderedTask alloc] initWithIdentifier:@"ConsentTask" steps:@[visualStep, reviewStep]];
}

@end
