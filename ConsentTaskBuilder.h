//
//  ConsentTaskBuilder.h
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import <ResearchKit/ResearchKit.h>

@interface ConsentTaskBuilder : NSObject

+ (ORKOrderedTask *)buildConsentTask;

@end
