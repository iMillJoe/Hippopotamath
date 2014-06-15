//
//  IMMutipalChoiceQuestion.h
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

@interface IMMutipalChoiceQuestion : NSObject

@property (nonatomic, copy) NSString* question;
@property (nonatomic, copy) NSString* answer;
@property (nonatomic, copy) NSArray* wrongAnswers;

// desiginated init;
-(id) initWithQuestion:(NSString *)question answer:(NSString *)answer andWrongAnswers:(NSArray *)wrongAnswers;

// determains whether or not a question was correctly answered
-(BOOL) isAnsweredCorrectlyWithAnswer:(NSString *)answer;

@end
