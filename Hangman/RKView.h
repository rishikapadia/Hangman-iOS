//
//  RKView.h
//  Hangman
//
//  Created by Rishi Kapadia on 3/1/13.
//  Copyright (c) 2013 Rishi Kapadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
@class RKViewController;

@interface RKView : UIView
{
@private
    RKViewController* _viewController;
    UIImage* _myImage;
}

@property (assign) RKViewController* _viewController;
@property (assign) UIImage* _myImage;

-(void)changeImage:(NSInteger)index;

@end
