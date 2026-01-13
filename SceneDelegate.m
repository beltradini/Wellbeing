//
//  SceneDelegate.m
//  Wellbeing
//
//  Created by Alejandro Beltrán on 1/12/26.
//

#import "SceneDelegate.h"
#import "ViewController.h"

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    ViewController *rootVC = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
}

@end
