//
//  IMHippoGameBrain.m
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

#import "IMHippoGameBrain.h"

@interface IMHippoGameBrain()

@property (readwrite) int score;
@property (nonatomic, strong) NSMutableArray* questionsArray;
@property int questionsAnswered;
-(IMMutipalChoiceQuestion*) pickRandomQuestion;

@end



@implementation IMHippoGameBrain

-(id)init
{
    self = [super init];
    
    if (self) {
        [self setupGame];
        return self;
    }
    
    return nil;
}

- (void) pickNewQuestion
{
    self.currentQuestion = [self pickRandomQuestion];
}

-(IMMutipalChoiceQuestion *) pickRandomQuestion
{
    if ([self.questionsArray count] == 0) {
        [self setupGame];
    }
    
    int questionIndex = arc4random() % [self.questionsArray count];
    
    IMMutipalChoiceQuestion* thisQuestion = [self.questionsArray objectAtIndex: questionIndex];
    [self.questionsArray removeObjectAtIndex:questionIndex];
    
    return thisQuestion;
}


- (BOOL) currentQuestionIsAnsweredCorrectlyWithAnswer:(NSString*) answer
{
    self.questionsAnswered+= 1;
    if ([self.currentQuestion isAnsweredCorrectlyWithAnswer:answer]){
        self.score++;
        return YES;
    }
    return NO;
}

- (void) setupGame
{
    //setup game logic
    
    // First Grade Questions
    IMMutipalChoiceQuestion* one =      [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"5 + 7 = ?" answer:@"12" andWrongAnswers:@[@"10", @"13", @"8"]];;
    IMMutipalChoiceQuestion* two =      [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"5 + 5 = ?" answer:@"10" andWrongAnswers:@[@"9", @"13", @"7"]];
    IMMutipalChoiceQuestion* three =    [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"5 - 3 = ?" answer:@"2" andWrongAnswers:@[@"1", @"8", @"4"]];
    IMMutipalChoiceQuestion* four =     [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"5 + ? = 8" answer:@"3" andWrongAnswers:@[@"5", @"2", @"7"]];
    IMMutipalChoiceQuestion* five =     [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"? + 3 = 5" answer:@"2" andWrongAnswers:@[@"7", @"1", @"3"]];
    IMMutipalChoiceQuestion* six =      [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"? - 5 = 4" answer:@"9" andWrongAnswers:@[@"12", @"10", @"2"]];
    IMMutipalChoiceQuestion* seven =    [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"a = 1; b = 2; c = a + b; What is c?" answer:@"3" andWrongAnswers:@[@"4", @"d", @"2"]];
    IMMutipalChoiceQuestion* eight =    [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"8 + 5 = ?" answer:@"13" andWrongAnswers:@[@"11", @"15", @"9"]];
    IMMutipalChoiceQuestion* nine =     [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"5 - 3 = ?" answer:@"2" andWrongAnswers:@[@"10", @"13", @"8"]];
    IMMutipalChoiceQuestion* ten =      [[IMMutipalChoiceQuestion alloc] initWithQuestion:@"5 + 3 = ?" answer:@"8" andWrongAnswers:@[@"9", @"13", @"12"]];
    //IMMutipalChoiceQuestion* nine = [[IMMutipalChoiceQuestion alloc] init];
    //IMMutipalChoiceQuestion* ten = [[IMMutipalChoiceQuestion alloc] init];
    
    self.questionsArray = [NSMutableArray arrayWithArray: @[one, two, three, four, five, six, seven, eight, nine, ten]];
    
    
    /* AFTER THE USER DOES WELL ENOUGH THAT THEY SHOULD PASS ON TO THE NEXT 'GRADE'
       THEY SHOULD MOVE ONTO GRADE 2 AND SO FORTH
     */
}

- (int) grade
{

    if (self.score > 0) {
        return (int) (( (float)[self score] / self.questionsAnswered ) * 100);
    }
    return 0;
}


@end
