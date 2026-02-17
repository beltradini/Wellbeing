//
//  ViewController.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "ViewController.h"
#import "ConsentTaskBuilder.h"
#import "DailySurveyTaskBuilder.h"
#import "SurveyResultStore.h"
#import "SurveyResultModel.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Wellbeing Study";
    self.view.backgroundColor = UIColor.systemBackgroundColor;

    UIBarButtonItem *consentButton = [[UIBarButtonItem alloc] initWithTitle:@"Consent"
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(startConsent)];

    UIBarButtonItem *surveyButton = [[UIBarButtonItem alloc] initWithTitle:@"Survey"
                                                                      style:UIBarButtonItemStylePlain
                                                                     target:self
                                                                     action:@selector(startDailySurvey)];

    self.navigationItem.rightBarButtonItems = @[surveyButton, consentButton];
}

- (void)startConsent {
    ORKOrderedTask *task = [ConsentTaskBuilder buildConsentTask];
    ORKTaskViewController *vc = [[ORKTaskViewController alloc] initWithTask:task taskRunUUID:nil];
    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)startDailySurvey {
	ORKOrderedTask *task = [DailySurveyTaskBuilder buildSurveyTask];
	ORKTaskViewController *vc = [[ORKTaskViewController alloc] initWithTask:task taskRunUUID:nil];
	vc.delegate = self;
	[self presentViewController:vc animated:YES completion:nil];
}

- (void)taskViewController:(ORKTaskViewController *)taskViewController
      didFinishWithReason:(ORKTaskViewControllerFinishReason)reason
                    error:(NSError *)error {
    if (reason == ORKTaskViewControllerFinishReasonCompleted) {
        if ([taskViewController.task.identifier isEqualToString:@"DailySurvey"]) {
            SurveyResultModel *model = [self surveyResultFrom:taskViewController.result];
            [SurveyResultStore saveResult:model];
        }
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Helpers

- (SurveyResultModel *)surveyResultFrom:(ORKTaskResult *)result {
    NSNumber *mood = [self numberAnswerForIdentifier:@"Mood" inResult:result];
    NSNumber *sleep = [self numberAnswerForIdentifier:@"Sleep" inResult:result];
    NSNumber *energy = [self numberAnswerForIdentifier:@"Energy" inResult:result];
    return [[SurveyResultModel alloc] initWithMood:mood sleepHours:sleep energy:energy];
}

- (NSNumber *)numberAnswerForIdentifier:(NSString *)identifier inResult:(ORKTaskResult *)taskResult {
    for (ORKStepResult *stepResult in taskResult.results) {
        if (![stepResult.identifier isEqualToString:identifier]) { continue; }
        ORKQuestionResult *questionResult = (ORKQuestionResult *)stepResult.results.firstObject;
        id answer = questionResult ? questionResult.answer : nil;
        if ([answer isKindOfClass:[NSNumber class]]) {
            return (NSNumber *)answer;
        }
    }
    return nil;
}

@end
