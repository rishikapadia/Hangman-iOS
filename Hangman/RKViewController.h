//
//  RKViewController.h
//  Hangman
//
//  Created by Rishi Kapadia on 3/1/13.
//  Copyright (c) 2013 Rishi Kapadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <AVFoundation/AVFoundation.h>
#import "RKView.h"
#import "RKModel.h"

@interface RKViewController : UIViewController
{
@private
    RKView* _myView;
    //UIImageView* _myHangImage;
    RKModel* _myModel;
    UIImageView* _winImage;
    AVAudioPlayer* _backgroundSound;
    AVAudioPlayer* _winSound;
    AVAudioPlayer* _lostSound;
}

@property (retain) IBOutlet RKView* _myView;
//@property (retain) IBOutlet UIImageView* _myHangImage;
@property (retain) IBOutlet UIImageView* _winImage;
@property (retain) RKModel* _myModel;

-(IBAction)resetButtonPressed:(UIButton*)sender;
-(IBAction)guessEntered:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel* updateCurrent;
@property (retain, nonatomic) IBOutlet UILabel* updateCurrentWrong;



@end
