//
//  IMHippoGameBrain.h
//  Hippopotamath
//
/* Hippopotamath, an educational mulitpal choice math game for kids.
 
 Copyright (C) 2014  iMill Industries
 
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program. (in IMAppDelegate.h) If not, see <http://www.gnu.org/licenses/>.
 */

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





