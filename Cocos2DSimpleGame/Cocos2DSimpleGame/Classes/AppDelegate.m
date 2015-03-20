//
//  AppDelegate.m
//  Cocos2DSimpleGame
//
//  Created by Martin Walsh on 18/01/2014.
//  Copyright Razeware LLC 2014. All rights reserved.
//
// -----------------------------------------------------------------------

#import "AppDelegate.h"
#import "IntroScene.h"
#import "HelloWorldScene.h"

@implementation AppDelegate

- (void) nombre
{
    NSLog(@"Jorge");
}

- (AppDelegate*) nombre:(float)var1 yOtraVariable:(int)var2 yTambienOtraVariable:(NSString *)var3
{
    return self;
}

- (void) setAction:(CCAction *)action
{
    _action = action;
    NSLog(@"set action");
}

// 
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[self nombre:0.5f yOtraVariable:0 yTambienOtraVariable:@"hola"] nombre];
    
    [self setAction:nil];
    CCAction* act = self.action;
    
	// This is the only app delegate method you need to implement when inheriting from CCAppDelegate.
	// This method is a good place to add one time setup code that only runs when your app is first launched.
	
	// Setup Cocos2D with reasonable defaults for everything.
	// There are a number of simple options you can change.
	// If you want more flexibility, you can configure Cocos2D yourself instead of calling setupCocos2dWithOptions:.
	[self setupCocos2dWithOptions:@{
		// Show the FPS and draw call label.
		CCSetupShowDebugStats: @(YES),
		
		// More examples of options you might want to fiddle with:
		// (See CCAppDelegate.h for more information)
		
		// Use a 16 bit color buffer: 
//		CCSetupPixelFormat: kEAGLColorFormatRGB565,
		// Use a simplified coordinate system that is shared across devices.
//		CCSetupScreenMode: CCScreenModeFixed,
		// Run in portrait mode.
//		CCSetupScreenOrientation: CCScreenOrientationPortrait,
		// Run at a reduced framerate.
//		CCSetupAnimationInterval: @(1.0/30.0),
		// Run the fixed timestep extra fast.
//		CCSetupFixedUpdateInterval: @(1.0/180.0),
		// Make iPad's act like they run at a 2x content scale. (iPad retina 4x)
//		CCSetupTabletScale2X: @(YES),
	}];
	
	return YES;
}

-(CCScene *)startScene
{
	// This method should return the very first scene to be run when your app starts.
	return [IntroScene scene];
}

@end
