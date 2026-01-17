//
//  DailySurveyTaskBuilder.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "DailySurveyTaskBuilder.h"

@implementation DailySurveyTaskBuilder

+ (ORKOrderedTask *)buildSurveyTask {
    
    ORKQuestionStep *moodStep = [ORKQuestionStep questionStepWithIdentifier:@"Mood" title:@"Mood" answer:[ORKScaleAnswerFormat scaleAnswerFormatWithMaximumValue:10 minimumValue:0 defaultValue:5 step:1]];
    
    ORKQuestionStep *sleepStep = [ORKQuestionStep questionStepWithIdentifier:@"Sleep" title:@"Hours of Sleep" answer:[ORKNumericAnswerFormat decimalAnswerFormat]];
    
    ORKQuestionStep *energyStep =
    [ORKQuestionStep questionStepWithIdentifier:@"Energy" title:@"Energy Level" answer:[ORKScaleAnswerFormat scaleAnswerFormatWithMaximumValue:10 minimumValue:0 defaultValue:5 step:1]];
    
    return [[ORKOrderedTask alloc] initWithIdentifier:@"DailySurvey" steps:@[moodStep, sleepStep, energyStep]];
}

@end
