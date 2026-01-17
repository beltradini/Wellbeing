//
//  DailySurveyTaskBuilder.h
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import <ResearchKit/ResearchKit.h>

@interface DailySurveyTaskBuilder : NSObject

+ (ORKOrderedTask *)buildSurveyTask;

@end
