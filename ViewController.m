//
//  ViewController.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "ViewController.h"
#import "ConsentTaskBuilder.h"
#import "DailySurveyTaskBuilder.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Wellbeing Study";
    self.view.backgroundColor = UIColor.systemBackgroundColor;
     
    UIBarButtonItem *startButton = [[UIBarButtonItem alloc] initWithTitle:@"Start" style:UIBarButtonItemStylePlain target:self action:@selector(startColumn)];
}

- (void)startConsent {
    ORKOrderedTask *task = [ConsentTaskBuilder buildConsentTask];
    ORKTaskViewController *vc =
        [[ORKTaskViewController alloc] initWithTask:task taskRunUUID:nil];

    vc.delegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
