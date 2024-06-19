//
//  AppDelegate.m
//  YPPCubeTableDemo
//
//  Created by abc on 2024/6/18.
//
#import "LGFPSLabel.h"
#import "AppDelegate.h"
#import "LGFeedListController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    LGFeedListController *vc = [LGFeedListController new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBar.backgroundColor = UIColor.whiteColor;
    UIWindow *w = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    w.backgroundColor = UIColor.whiteColor;
    w.rootViewController = nav;
    [w makeKeyAndVisible];
    self.window = w;
    [self.window addSubview:[[LGFPSLabel alloc] initWithFrame:CGRectMake(10, 40, 100, 50)]];
    [NSUserDefaults.standardUserDefaults setValue:@(NO) forKey:@"_UIConstraintBasedLayoutLogUnsatisfiable"];
    return YES;
}




@end
