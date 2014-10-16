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


@property (strong, nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game)_game = [[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count]
                                                      usingDeck:[self createDeck]];
    return _game;
                       
}



-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}



- (IBAction)touchCardButton:(UIButton *)sender
{
    //CardMatchingGame now handles all effects of choosing a card
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    [self updateUI];
    
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
}


-(NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"CardFront" : @"CardBack"];
}
@end
