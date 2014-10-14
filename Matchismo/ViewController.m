//
//  ViewController.m
//  Matchismo
//
//  Created by Guwanjith Tennekoon on 10/14/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"CardBack"]
                          forState:UIControlStateNormal];
        
        [sender setTitle:@""
                forState:UIControlStateNormal];
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"CardFront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣️"
                forState:UIControlStateNormal];
    }
}

@end
