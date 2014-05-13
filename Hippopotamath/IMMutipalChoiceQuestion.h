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
@property (nonatomic, strong) NSMutableArray* wrongAnswers;



@end
