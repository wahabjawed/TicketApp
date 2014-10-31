//
//  SelectOption.m
//  TicketApp
//
//  Created by Avialdo on 28/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "SelectOption.h"

@interface SelectOption ()

@end

@implementation SelectOption

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doFight:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:@"You will be charged 10% of the citation amount upon this submission. If the citation doesnot get dismissed, You will have to pay in full." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Purchase", nil];
    [alertView show];
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if(buttonIndex==1){
    
        [self performSegueWithIdentifier:@"go" sender:self];
    
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
