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

@end
