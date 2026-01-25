//
//  SurveyResultModel.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "SurveyResultModel.h"

@implementation SurveyResultModel
// Designated initializer to set mood, sleep hours and energy values
- (instancetype)initWithMood:(NSNumber *)mood sleepHours:(NSNumber *)sleepHours energy:(NSNumber *)energy {
    self = [super init];
    if (self) {
        _mood = mood;
        _sleepHours = sleepHours;
        _energy = energy;
    }
    return self;
}

// Override description method to provide a meaningful debug description
- (NSString *)description {
    return [NSString stringWithFormat:@"<SurveyResultModel: mood=%@, sleepHours=%@, energy=%@>", self.mood, self.sleepHours, self.energy];
}

@end
