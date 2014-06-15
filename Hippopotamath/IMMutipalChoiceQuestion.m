//
//  IMMutipalChoiceQuestion.m
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

#import "IMMutipalChoiceQuestion.h"

@implementation IMMutipalChoiceQuestion

-(id) init
{
    [NSException raise:@"IMMutipalChoiceQuestion wrong init" format:@"use initWithQuestion: answer: andWrongAnswers"];
    
    return nil;
}

-(id) initWithQuestion:(NSString *)question answer:(NSString *)answer andWrongAnswers:(NSArray *)wrongAnswers
{
    self = [super init];
    if (self) {
        self.question = question;
        self.answer = answer;
        self.wrongAnswers = wrongAnswers;
        return self;
    }
    return nil;
}

- (BOOL) isAnsweredCorrectlyWithAnswer:(NSString *)answer
{
    if ([self.answer isEqualToString:answer]) return YES;
    return NO;
}
     
@end
