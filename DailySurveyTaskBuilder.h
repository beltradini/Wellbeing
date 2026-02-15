//
//  DailySurveyTaskBuilder.h
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "ResearchKitSupport.h"

@interface DailySurveyTaskBuilder : NSObject

+ (ORKOrderedTask *)buildSurveyTask;

@end
