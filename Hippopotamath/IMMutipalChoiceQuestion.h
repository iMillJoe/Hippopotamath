//
//  IMMutipalChoiceQuestion.h
//  Hippopotamath
//
//  Created by Joe Million on 5/12/14.
//  Copyright (c) 2014 iMillIndustries. All rights reserved.
//

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
