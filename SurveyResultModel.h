//
//  SurveyResultModel.h
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import <Foundation/Foundation.h>

@interface SurveyResultModel : NSObject

- (instancetype)initWithMood:(NSNumber *)mood
				  sleepHours:(NSNumber *)sleepHours
					  energy:(NSNumber *)energy;

@property (nonatomic, strong) NSNumber *mood;
@property (nonatomic, strong) NSNumber *sleepHours;
@property (nonatomic, strong) NSNumber *energy;

@end
