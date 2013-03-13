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
@synthesize _textBox;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        [self changeImage:0];
        _textBox = [[UITextField alloc] init];
    }
    
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_textBox resignFirstResponder];
    [self becomeFirstResponder];
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
    [_textBox autorelease];
    [super dealloc];
}

@end
