//
//  RKModel.h
//  Hangman
//
//  Created by Rishi Kapadia on 3/1/13.
//  Copyright (c) 2013 Rishi Kapadia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HangmanWords.h"

@interface RKModel : NSObject
{
@private
    HangmanWords* _generator;
    NSMutableSet* _leftToGuess;
    NSInteger _numberWrong;
    NSMutableSet* _wrongGuesses;
    NSString* _currWord;
    
    NSString* _current;
    NSString* _currentWrong;
}

@property (retain) NSString* _current;
@property (retain) NSString* _currWord;
@property (assign) NSInteger _numberWrong;
@property (retain) NSString* _currentWrong;
@property (nonatomic, retain) NSMutableSet* _leftToGuess;
@property (nonatomic, retain) NSMutableSet* _wrongGuesses;

-(void)reset;
-(void)enterGuess:(NSString*)guess;
-(BOOL)gameEnded;
-(BOOL)gameWon;
-(void)updateCurrentWrong;
-(void)updateCurrent;
-(BOOL)setContains:(NSMutableSet*)s elem:(NSString*)e;

@end
