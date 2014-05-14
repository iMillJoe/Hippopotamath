//
//  IMHippoGameBrain.m
//  Hippopotamath
//
//  Created by Joe Million on 5/12/14.
//  Copyright (c) 2014 iMillIndustries. All rights reserved.
//

#import "IMHippoGameBrain.h"

@implementation IMHippoGameBrain

-(id)init
{
    self = [super init];
    if (self) {
        
        //setup game logic
        IMMutipalChoiceQuestion* one = [[IMMutipalChoiceQuestion alloc] init];
        one.question = @"What is CS50";
        one.answer = @"This! (is CS50)";
        one.wrongAnswers = [NSMutableArray arrayWithArray: @[@"Nothing is CS50", @"Another wrong answer", @"Yet antoher wrong one"]];
        
        IMMutipalChoiceQuestion* two = [[IMMutipalChoiceQuestion alloc] init];
        two.question = @"5 + 5 = ?";
        two.answer = @"10";
        two.wrongAnswers = [NSMutableArray arrayWithArray: @[@"9", @"13", @"7"]];
        
        IMMutipalChoiceQuestion* three = [[IMMutipalChoiceQuestion alloc] init];
        three.question = @"5 - 3 = ?";
        three.answer = @"2";
        three.wrongAnswers = [NSMutableArray arrayWithArray: @[@"1", @"8", @"4"]];
        
        IMMutipalChoiceQuestion* four = [[IMMutipalChoiceQuestion alloc] init];
        four.question = @"5 + ? = 8";
        four.answer = @"3";
        four.wrongAnswers = [NSMutableArray arrayWithArray: @[@"5", @"2", @"7"]];
        
        IMMutipalChoiceQuestion* five = [[IMMutipalChoiceQuestion alloc] init];
        five.question = @"? + 3 = 5";
        five.answer = @"2";
        five.wrongAnswers = [NSMutableArray arrayWithArray: @[@"7", @"1", @"3"]];
        
        //IMMutipalChoiceQuestion* six = [[IMMutipalChoiceQuestion alloc] init];
        //IMMutipalChoiceQuestion* seven = [[IMMutipalChoiceQuestion alloc] init];
        //IMMutipalChoiceQuestion* eight = [[IMMutipalChoiceQuestion alloc] init];
        //IMMutipalChoiceQuestion* nine = [[IMMutipalChoiceQuestion alloc] init];
        //IMMutipalChoiceQuestion* ten = [[IMMutipalChoiceQuestion alloc] init];
        
        self.questionsArray = [NSMutableArray arrayWithArray: @[one, two, three, four, five,]];
        
        
        
        
        return self;
    }
    
    return nil;
}


-(IMMutipalChoiceQuestion *) pickRandomQuestion
{    
    int questionIndex = arc4random() % [self.questionsArray count];
    
    IMMutipalChoiceQuestion* thisQuestion = [self.questionsArray objectAtIndex: questionIndex];
    [self.questionsArray removeObjectAtIndex:questionIndex];
    
    return thisQuestion;
}



@end
