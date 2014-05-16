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
- (BOOL) currentQuestionIsAnsweredCorrectlyWithAnswer:(NSString*) answer;
- (int) grade; // precentage of question answered correctly
@end





