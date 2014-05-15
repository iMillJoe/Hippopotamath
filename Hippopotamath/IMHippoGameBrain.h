//
//  IMHippoGameBrain.h
//  Hippopotamath
//
//  Created by Joe Million on 5/12/14.
//  Copyright (c) 2014 iMillIndustries. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMMutipalChoiceQuestion.h"

@interface IMHippoGameBrain : NSObject

// Properties
@property (readonly) int score; // the score of the game
@property (strong, nonatomic) IMMutipalChoiceQuestion* currentQuestion; // the question that should be presented.

// Instance Methods
- (void) pickNewQuestion; // asks the game to pick a new question (if possable)
@end


/* I have decided that the game should hold the current question, not the view controler presenting it. 
    The view controller presenting the question should asking be the game if it was answerd correcrtly.
    The game should then ask the question whether or not it was correctly answerd */



