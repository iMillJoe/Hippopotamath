//
//  IMViewController.m
//  Hippopotamath
//
//  Created by Joe Million on 5/11/14.
//  Copyright (c) 2014 iMillIndustries. All rights reserved.
//

#import "IMHippoGameViewController.h"
#import "IMMutipalChoiceQuestion.h"
#import "IMHippoGameBrain.h"



@interface IMHippoGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *question;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ansButtons;

@property IMHippoGameBrain* game;


@end

@implementation IMHippoGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    if (!self.game) {
        self.game = [[IMHippoGameBrain alloc] init];
        
    }
    
    IMMutipalChoiceQuestion* thisQuestion = [self.game pickRandomQuestion];
    
    self.question.text = thisQuestion.question;
    srand48([NSDate timeIntervalSinceReferenceDate]);
    
    int correctAnsIndex = rand() % ([thisQuestion.wrongAnswers count] + 1);
    
    [[self.ansButtons objectAtIndex:correctAnsIndex] setTitle: thisQuestion.question];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
