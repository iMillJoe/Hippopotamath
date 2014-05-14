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

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ansButtons;




@property (strong, nonatomic) IMMutipalChoiceQuestion *currentQuestion;
@property IMHippoGameBrain* game;

-(void) setupQuestion;



@end

@implementation IMHippoGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if (!self.game) {
        self.game = [[IMHippoGameBrain alloc] init];
    }
    [self setupQuestion];
}

- (IBAction)ansButtonPressed:(id)sender;
{
    if ([[sender currentTitle] isEqualToString: self.currentQuestion.answer]) [self feedHippo];
    else [self dontFeedHippo];
}

-(void) setupQuestion;
{
    self.currentQuestion = [self.game pickRandomQuestion];
    self.questionLabel.text = self.currentQuestion.question;
    int correctAnsIndex = arc4random() % [self.ansButtons count];
    bool peek = NO;
    
    //set button titles
    for (int i = 0; i < [self.ansButtons count]; i++) {
        if (i == correctAnsIndex) {
            [[self.ansButtons objectAtIndex:i] setTitle:[self.currentQuestion answer] forState:UIControlStateNormal];
            peek = YES;
        }
        else if (!peek) {
            [[self.ansButtons objectAtIndex:i] setTitle:[[self.currentQuestion wrongAnswers] objectAtIndex:i] forState:UIControlStateNormal];
        }
        else {
            [[self.ansButtons objectAtIndex:i] setTitle:[[self.currentQuestion wrongAnswers] objectAtIndex:i - 1] forState:UIControlStateNormal];
            
            
        }
    }
}

- (void) feedHippo
{
    //Feed the hippo
    NSLog(@"Feed the hippo");
    [self setupQuestion];
}

- (void) dontFeedHippo
{
    //Angry Hippo time.
    NSLog(@"Hippo no hungry");
    [self setupQuestion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
