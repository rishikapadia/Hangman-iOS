//
//  RKModel.m
//  Hangman
//
//  Created by Rishi Kapadia on 3/1/13.
//  Copyright (c) 2013 Rishi Kapadia. All rights reserved.
//

#import "RKModel.h"

@implementation RKModel

@synthesize _currWord;
@synthesize _current;
@synthesize _numberWrong;
@synthesize _currentWrong;
@synthesize _leftToGuess;
@synthesize _wrongGuesses;

-(id)init
{
    self = [super init];
    if (self)
    {
        _generator = [[HangmanWords alloc] init];
        _leftToGuess = [[NSMutableSet alloc] init];
        _wrongGuesses = [[NSMutableSet alloc] init];
        _currentWrong = @"";
        _current = @"";
        _numberWrong = 0;
        [self reset];
    }
    return self;
}

-(void) reset
{
    self._currWord = [[_generator getWord] uppercaseString];
    
    NSLog(@"%@", _currWord);
    [_leftToGuess removeAllObjects];
    [_wrongGuesses removeAllObjects];
    _numberWrong = 0;
    
    for (int i = 0; i < [_currWord length]; i++)
    {
        [_leftToGuess addObject:[_currWord substringWithRange:NSMakeRange(i, 1)]];
    }
    if ([self setContains:_leftToGuess elem:@" "])
        [_leftToGuess removeObject:@" "];
    
    
    //generate _current
    [self updateCurrent];
    _currentWrong = @"Incorrect Guesses: ";
}

-(void)enterGuess:(NSString*)guess
{
    if ([self gameEnded])
        return;
    
    //if ([_current rangeOfString:guess].location != NSNotFound)
    //    return;
    
    guess = [guess uppercaseString];
    //[guess copy];
    
    //if == _currWord, gameWon = true, gameOver = true, return
    if ([guess isEqualToString: _currWord])
    {
        [_leftToGuess removeAllObjects];
        [self updateCurrent];
        //[guess autorelease];
        return;
    }

    //if right, remove from set, update _current
    if ([self setContains:_leftToGuess elem: guess])
    {
        [_leftToGuess removeObject:guess];
    }
    else
    {
        NSInteger prevTotal = [_wrongGuesses count];
        [_wrongGuesses addObject:guess];
        if (prevTotal != [_wrongGuesses count])
            _numberWrong += 1;
    }
    //if wrong, increment _numberWrong, add to _wrongGuesses, update Wrong
    
    [self updateCurrentWrong];
    [self updateCurrent];
    //[guess autorelease];
}

-(BOOL)setContains:(NSMutableSet*)s elem:(NSString*)e
{
    //[s retain];
    //[e copy];
    for (NSString* elem in s)
    {
        if ([e isEqualToString:elem])
        {
            //[s autorelease];
            //[e autorelease];
            return true;
        }
    }
    //[s autorelease];
    //[e autorelease];
    return false;
}


-(void)updateCurrentWrong
{
    _currentWrong = @"Incorrect Guesses: ";
    for (NSString* e in _wrongGuesses)
    {
        _currentWrong = [NSString stringWithFormat:@"%@%@%@", _currentWrong, e, @" "];
    }
}

-(void)updateCurrent
{
    _current = @"";
    for (int i=0; i<[_currWord length]; i++)
    {
        NSString* e = [_currWord substringWithRange:NSMakeRange(i, 1)];
        
        if ([e isEqualToString:@" "] || [e isEqualToString:@"\n"] || ![self setContains:_leftToGuess elem:e])
        {
            _current = [NSString stringWithFormat:@"%@%@%@", _current, e, @" "];
        }
        else
        {
            _current = [NSString stringWithFormat:@"%@%@", _current, @"_ "];
        }
    }
    
    /////FIX STRING WRAPPING ISSUE!!!////
    
    //_current = [_current stringByReplacingOccurrencesOfString:@"   " withString:@"\n"];
}

-(BOOL)gameEnded
{
    return ([_leftToGuess count] == 0) || ([_wrongGuesses count] >= 6);
}

-(BOOL)gameWon
{
    return ([_leftToGuess count] == 0);
}

-(void)dealloc
{
    [_generator autorelease];
    [_leftToGuess autorelease];
    [_wrongGuesses autorelease];
    [_currWord autorelease];
    [_current autorelease];
    [_currentWrong autorelease];
    [super dealloc];
}

@end
