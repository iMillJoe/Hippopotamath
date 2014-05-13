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

@property (nonatomic, strong) NSMutableArray* questionsArray;
@property int score;

-(IMMutipalChoiceQuestion*) pickRandomQuestion;


@end
