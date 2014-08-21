//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Yann's AW Office on 21/08/2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //Call the int method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Create two arrays filled with questions and answers and make the pointers point to them
        self.questions = @[@"From what is Cognac made of?",
                           @"What is 7+7?",
                           @"What is the Capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpellier"];
    }
    //Return the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    //Step to the next question
    self.currentQuestionIndex++;
    
    //Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count])
    {
        //Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    //Get the string that the in the questions array
    NSString *question = self.questions[self.currentQuestionIndex];
    
    //Display the string in the questions label
    self.questionLabel.text = question;
    
    //Reset the answer label
    self.answerLabel.text = @"???WTF is it???";
}

- (IBAction)showAnswer:(id)sender
{
    //What is the answer to the current questions?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //Display it in the answer label
    self.answerLabel.text = answer;
}

@end
