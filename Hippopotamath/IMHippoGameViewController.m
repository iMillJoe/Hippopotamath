//
//  IMViewController.m
//  Hippopotamath

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
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "IMHippoGameViewController.h"
#import "IMMutipalChoiceQuestion.h"
#import "IMHippoGameBrain.h"



// Private declarations
@interface IMHippoGameViewController ()

@property IMHippoGameBrain* game;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ansButtons;
@property (weak, nonatomic) IBOutlet UILabel *tempAnsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;

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
    if ([self.game currentQuestionIsAnsweredCorrectlyWithAnswer:[sender currentTitle] ]) [self feedHippo];
    else [self dontFeedHippo];
}

-(void) setupQuestion;
{
    [self.game pickNewQuestion];
    self.questionLabel.text = self.game.currentQuestion.question;
    int correctAnsIndex = arc4random() % [self.ansButtons count];
    
    // set button titles
    bool peek = NO;
    for (int i = 0; i < [self.ansButtons count]; i++) {
        if (i == correctAnsIndex) {
            [[self.ansButtons objectAtIndex:i] setTitle:[self.game.currentQuestion answer] forState:UIControlStateNormal];
            peek = YES;
        }
        else if (!peek) {
            [[self.ansButtons objectAtIndex:i] setTitle:[[self.game.currentQuestion wrongAnswers] objectAtIndex:i] forState:UIControlStateNormal];
        }
        else {
            [[self.ansButtons objectAtIndex:i] setTitle:[[self.game.currentQuestion wrongAnswers] objectAtIndex:i - 1] forState:UIControlStateNormal];
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.game.score];
    self.gradeLabel.text = [NSString stringWithFormat:@"Grade: %i%%", self.game.grade];
    
}

- (void) feedHippo
{
    // Feed the hippo
    NSLog(@"Feed the hippo");
    [self.tempAnsLabel setText:@"Great Job, I'm very hungry!"];
    [self setupQuestion];

}

- (void) dontFeedHippo
{
    // Angry Hippo time.
    NSLog(@"Hippo is not hungry");
    [self.tempAnsLabel setText:@"I'm not so hungry right now"];
    [self setupQuestion];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
