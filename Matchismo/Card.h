//
//  Card.h
//  Matchismo
//
//  Created by Guwanjith Tennekoon on 10/14/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (strong, getter = isChosen) BOOL chosen;
@property (strong, getter = isMatched) BOOL matched;

- (int)match: (NSArray *)otherCards;


@end
