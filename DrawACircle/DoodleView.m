//
//  DoodleView.m
//  doodle
//
//  Created by T. Andrew Binkowski on 11/1/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DoodleView.h"

@implementation DoodleView
@synthesize firstTouch,lastTouch;
@synthesize path;

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.multipleTouchEnabled = NO;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
	path = [UIBezierPath bezierPath];	
	path.lineWidth = 15.0f;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
	
	UITouch *touch = [touches anyObject];
	[path moveToPoint:[touch locationInView:self]];
}

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) touchesMoved:(NSSet *) touches withEvent:(UIEvent *) event
{
	UITouch *touch = [touches anyObject];
	[path addLineToPoint:[touch locationInView:self]];
	[self setNeedsDisplay];
}

/*******************************************************************************
 * @method       method 
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	[path addLineToPoint:[touch locationInView:self]];
	[self setNeedsDisplay];
}

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self touchesEnded:touches withEvent:event];
}

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) clear 
{
    NSLog(@"Clear");
    [path removeAllPoints];
    [self setNeedsDisplay];
}

/*******************************************************************************
 * @method      <# method #>
 * @abstract    <# abstract #>
 * @description <# description #>
 *******************************************************************************/
- (void) drawRect:(CGRect)rect
{
	[[UIColor blueColor] set];
	[path stroke];
}
@end
