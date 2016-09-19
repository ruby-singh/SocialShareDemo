//
//  ViewController.m
//  socialshare
//
//  Created by Ruby on 1/25/16.
//  Copyright © 2016 Hello World Organisation. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextView *tweetTextArea;
@property (strong, nonatomic) IBOutlet UITextView *facebookTextArea;
@property (strong, nonatomic) IBOutlet UITextView *moreTextArea;
- (void) configureTextView;
- (void) showalertMessage:(NSString *) message;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextView];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void) showalertMessage:(NSString *) message{
    
    UIAlertController *alertController;
    
    alertController = [UIAlertController alertControllerWithTitle:@"SocialShare" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (IBAction)tweetTapped:(id)sender {
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){
        //tweet
        
        SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        if([self.tweetTextArea.text length] < 140){
            
            [twitterVC setInitialText:self.tweetTextArea.text];
        }else{
            
            
            NSString *shortText = [self.tweetTextArea.text substringToIndex:140];
            
            [twitterVC setInitialText:shortText];
        }
        
        [self presentViewController:twitterVC animated:YES completion:nil];
        
    }else{
        //raise error if issues
        [self showalertMessage:@"Please signin in to Twitter "];
    }



    
}
- (IBAction)postToFBTapped:(id)sender {
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]){
        //tweet
        
        SLComposeViewController *faceBookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        
        [faceBookVC setInitialText:self.facebookTextArea.text];
        
        
        
        [self presentViewController:faceBookVC animated:YES completion:nil];
        
    }else{
        //raise error if issues
        [self showalertMessage:@"Please signin in to Facebook "];
    }
}
- (IBAction)moreTapped:(id)sender {
    
    UIActivityViewController *moreVC = [UIActivityViewController alloc];
    [moreVC initWithActivityItems:@[self.moreTextArea.text] applicationActivities:nil];
    
    
    [self presentViewController:moreVC animated:YES completion:nil];

}
- (IBAction)noAction:(id)sender {
    
    UIAlertController *alertController;
    
    alertController = [UIAlertController alertControllerWithTitle:@"SocialShare" message:@"No Action Added !!" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];

}
- (void) configureTextView{
    
    //self.tweetTextArea.layer.backgroundColor =[UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    
    self.tweetTextArea.layer.cornerRadius = 10.0;
    self.tweetTextArea.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.tweetTextArea.layer.borderWidth = 3.0;
    
    self.facebookTextArea.layer.cornerRadius = 10.0;
    self.facebookTextArea.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.facebookTextArea.layer.borderWidth = 3.0;
    
    self.moreTextArea.layer.cornerRadius = 10.0;
    self.moreTextArea.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.moreTextArea.layer.borderWidth = 3.0;
    
}

@end
