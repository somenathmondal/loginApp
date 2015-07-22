//
//  ViewController.m
//  loginApp
//
//  Created by Somenath Mondal on 10/07/15.
//  Copyright (c) 2015 Somenath Mondal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)loginUser:(id)sender
{
    
   
    
    /*
    if ([[infodictionary objectForKey:username.text]isEqualToString:password.text]) {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Correct Password" message: @"The password is correct."  delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [alert show];
    } else {
        UIAlertView *alert= [[UIAlertView alloc] initWithTitle:@"Inorrect Password" message: @"The password is incorrect."  delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [alert show];
    }*/
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //infodictionary = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"password", nil] forKeys:[NSArray arrayWithObjects:@"username", nil]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if( ![defaults boolForKey:@"registered"])
    {
        NSLog(@"No user registered.");
        _loginBtn.hidden= YES;
    }
    else
    {
        NSLog(@"User is registered.");
        _registerBtn.hidden=YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)registerUser:(id)sender {
    if([_username.text isEqualToString:@""] || [_password.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Slight Error" message: @"Have to fill in both fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        [self registerNewUser];
    }
    
    
}

- (void)registerNewUser {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:_username.text forKey:@"username"];
    [defaults setObject:_password.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"];
    [defaults synchronize];
    
    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message: @"Registered successfully" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [success show];
    
    //[self performSegueWithIdentifier:@"login" sender:self];

    [self shouldPerformSegueWithIdentifier:@"login" sender:self];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    //[self getDetails];
    
    if ([identifier isEqualToString:@"login"])
    {
        
        if (([_username.text isEqualToString:@"username"])&&([_password.text isEqualToString:@"password"]))
        {
            
            _username.text=@"";
            _password.text=@"";
            
            return YES;
        }
        else
        {
            UIAlertView *loginAlert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Invalid Details" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
            
            [loginAlert show];
            
            _username.text=@"";
            _password.text=@"";
            
            return NO;
        }
        
    }
    
    return YES;
}
@end
