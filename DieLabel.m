//
//  DieLabel.m
//  Farkle
//
//  Created by ETC ComputerLand on 7/30/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "DieLabel.h"

@implementation DieLabel



-(IBAction)onTapped:(UITapGestureRecognizer *)sender
{
    [self.delegate didChooseDie:self];
}

-(void)roll
{
    self.text = [NSString stringWithFormat:@"%i", (arc4random() % 5) + 1];
}

@end
