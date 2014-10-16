//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Guwanjith Tennekoon on 10/16/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,readwrite)NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of Card;

@end

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;


@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards)_cards = [[NSMutableArray alloc]init];
    return _cards;
}


-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count])? self.cards[index] : nil;
    //If index is not out of bounds return card at index, else return nil
}


-(void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if(card.isChosen){
            card.Chosen = NO;
        }else{
            //match against other cards
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    self.score -= COST_TO_CHOOSE;
                    break; //can only choose two cards for now
                }
            }
        }
    }
}

@end
