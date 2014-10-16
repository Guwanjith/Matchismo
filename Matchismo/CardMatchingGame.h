//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Guwanjith Tennekoon on 10/16/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//Designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSInteger score;


@end
