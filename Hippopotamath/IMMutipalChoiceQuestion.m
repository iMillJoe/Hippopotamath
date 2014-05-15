//
//  IMMutipalChoiceQuestion.m
//  Hippopotamath
//
//  Created by Joe Million on 5/12/14.
//  Copyright (c) 2014 iMillIndustries. All rights reserved.
//

#import "IMMutipalChoiceQuestion.h"

@implementation IMMutipalChoiceQuestion

-(id) init
{
    [NSException raise:@"IMMutipalChoiceQuestion wrong init" format:@"use initWithQuestion: answer: andWrongAnswer"];
    
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
