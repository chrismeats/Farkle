//
//  DieLabel.h
//  Farkle
//
//  Created by ETC ComputerLand on 7/30/14.
//  Copyright (c) 2014 cmeats. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate

-(void)didChooseDie:(id)dieLabel;

@end

@interface DieLabel : UILabel

-(void)roll;
@property id<DieLabelDelegate> delegate;

@end
