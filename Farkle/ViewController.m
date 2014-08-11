//
//  ViewController.m
//  Farkle
//
//  Created by ETC ComputerLand on 7/30/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"


@interface ViewController () <DieLabelDelegate>
@property (strong, nonatomic) IBOutlet UILabel *currentBankLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dice = [[NSMutableArray alloc] init];


    // This is only here to satisfy CheckMate
    for (DieLabel *dieLabel in self.view.subviews) {
        if ([dieLabel isKindOfClass:[DieLabel class]]) {
            dieLabel.delegate = self;
        }
    }

}


- (IBAction)onRollButtonPressed:(id)sender {
    for (DieLabel *dieLabel in self.view.subviews) {
        if ([dieLabel isKindOfClass:[DieLabel class]]) {
            if (![self.dice containsObject:dieLabel]) {
                [dieLabel roll];
            }
            dieLabel.delegate = self;
        }
    }
    [self getScore];
}

-(void)didChooseDie:(id)dieLabel
{
	[self.dice addObject:dieLabel];
}

-(NSNumber *)getScore
{

    int score = 0;

    int diceCount1 = 0;
    int diceCount2 = 0;
    int diceCount3 = 0;
    int diceCount4 = 0;
    int diceCount5 = 0;
    int diceCount6 = 0;
    for (DieLabel *dieLabel in self.view.subviews) {
        if ([dieLabel isKindOfClass:[DieLabel class]]) {
            if ([dieLabel.text isEqualToString:@"1"]) {
                diceCount1++;
            } else if ([dieLabel.text isEqualToString:@"2"]) {
                diceCount2++;
            } else if ([dieLabel.text isEqualToString:@"3"]) {
                diceCount3++;
            } else if ([dieLabel.text isEqualToString:@"4"]) {
                diceCount4++;
            } else if ([dieLabel.text isEqualToString:@"5"]) {
                diceCount5++;
            } else if ([dieLabel.text isEqualToString:@"6"]) {
                diceCount6++;
            }
        }
    }
    if (diceCount1 >= 3) {
        score += 1000;
    } else {
        score += diceCount1 * 100;
    }
    if (diceCount2 >= 3) {
        score += 200;
    }
    if (diceCount3 >= 3) {
        score += 300;
    }
    if (diceCount4 >= 3) {
        score += 400;
    }
    if (diceCount5 >= 3) {
        score += 500;
    } else {
        score += diceCount5 * 50;
    }
    if (diceCount6 >= 6) {
        score += 600;
    }

    self.currentBankLabel.text = [NSString stringWithFormat:@"%i", score];

    return nil;
}

@end
