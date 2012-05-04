//
//  ViewController.m
//  DrawACircle
//
//  Created by T. Binkowski on 5/4/12.
//  Copyright (c) 2012 University of Chicago. All rights reserved.
//

#import "ViewController.h"
#import "CircleGestureRecognizer.h"
#import "DoodleView.h"

@interface ViewController ()

@end


@implementation ViewController

@synthesize doodleView;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Load the doodle view
    CGRect window = [[UIScreen mainScreen] bounds];
    self.doodleView = [[DoodleView alloc] initWithFrame:window];
    
    CircleGestureRecognizer *recognizer = [[CircleGestureRecognizer alloc] initWithTarget:self action:@selector(handleCircleRecognizer:)]; 
	[self.doodleView addGestureRecognizer:recognizer];
    [self.view addSubview:self.doodleView];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}
- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
}

#pragma mark - Orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Recognizer Delegate

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) handleCircleRecognizer:(UIGestureRecognizer *) recognizer
{
	NSLog(@"Circle recognized");
}



#pragma mark - Shake
/*******************************************************************************
 * @method      <# method #>
 * @abstract    Let the view controller respond to motion events
 * @description <# description #>
 *******************************************************************************/
- (BOOL)canBecomeFirstResponder {
    return YES;
}

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    //if (motion != UIEventSubtypeMotionShake) return; 
}

/*******************************************************************************
 * @method       method 
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventTypeMotion && event.type == UIEventSubtypeMotionShake) {
        NSLog(@"Motion Ended on %@", [NSDate date]);
        [self.doodleView clear];
    }
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)]) {
        [super motionEnded:motion withEvent:event];
    }
}
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {}

@end
