//
//  ViewController.m
//  Matchismo
//
//  Created by Guwanjith Tennekoon on 10/14/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic)Deck *deck;
@property (strong, nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game)_game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]];
    return _game;
                       
}

-(Deck *)deck
{
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    //CardMatchingGame now handles all effects of choosing a card
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    [self updateUI];
    
    self.flipCount++;
}

-(void)updateUI
{
        
}

@end
