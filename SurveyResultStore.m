//
//  SurveyResultStore.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "SurveyResultStore.h"

static NSString *const kSurveyResultsKey = @"SurveyResults";

@implementation SurveyResultStore

+ (void)saveResult:(SurveyResultModel *)result {
	if (result == nil) {
		return;
	}

	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSArray *stored = [defaults arrayForKey:kSurveyResultsKey] ?: @[];
	NSMutableArray *mutable = [stored mutableCopy];

	NSDictionary *payload = @{ @"mood": result.mood ?: [NSNull null],
								 @"sleepHours": result.sleepHours ?: [NSNull null],
								 @"energy": result.energy ?: [NSNull null],
								 @"timestamp": @([[NSDate date] timeIntervalSince1970]) };
	[mutable addObject:payload];

	[defaults setObject:[mutable copy] forKey:kSurveyResultsKey];
	[defaults synchronize];
}

+ (NSArray<SurveyResultModel *> *)loadResults {
	NSArray *stored = [[NSUserDefaults standardUserDefaults] arrayForKey:kSurveyResultsKey];
	if (stored.count == 0) {
		return @[];
	}

	NSMutableArray<SurveyResultModel *> *results = [NSMutableArray arrayWithCapacity:stored.count];
	for (NSDictionary *dict in stored) {
		NSNumber *mood = [dict objectForKey:@"mood"];
		NSNumber *sleep = [dict objectForKey:@"sleepHours"];
		NSNumber *energy = [dict objectForKey:@"energy"];
		SurveyResultModel *model = [[SurveyResultModel alloc] initWithMood:mood sleepHours:sleep energy:energy];
		[results addObject:model];
	}
	return [results copy];
}

@end

