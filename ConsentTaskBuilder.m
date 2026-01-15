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
}

@end
