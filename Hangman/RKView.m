//
//  RKView.m
//  Hangman
//
//  Created by Rishi Kapadia on 3/1/13.
//  Copyright (c) 2013 Rishi Kapadia. All rights reserved.
//

#import "RKView.h"
#import "RKViewController.h"

@implementation RKView

@synthesize _viewController;
@synthesize _myImage;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [self changeImage:0];
    }
    
    return self;
}

-(void)changeImage:(NSInteger)index
{
    NSString* img = [NSString stringWithFormat:@"%@%i%@", @"hang", index, @".jpg"];
    _myImage = [UIImage imageNamed:img];
}

-(void) dealloc
{
    [_viewController autorelease];
    [_myImage autorelease];
    [super dealloc];
}

@end
