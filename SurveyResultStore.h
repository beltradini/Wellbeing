//
//  SurveyResultStore.h
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "SurveyResultModel.h"

@interface SurveyResultStore : NSObject
+ (void)saveResult:(SurveyResultModel *)result;
@end
