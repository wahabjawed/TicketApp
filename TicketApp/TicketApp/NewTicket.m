//
//  NewTicket.m
//  TicketApp
//
//  Created by Avialdo on 27/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "NewTicket.h"

@interface NewTicket ()

@property (weak, nonatomic) IBOutlet UILabel *PhotoLabel;

@property (weak, nonatomic) IBOutlet UIButton *roundButton;
@end

@implementation NewTicket



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.PhotoLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.PhotoLabel.numberOfLines = 0;
    
      self.roundButton.layer.cornerRadius=20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goButton:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"What do you want to do?"
                                  delegate:self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"Camera", @"Photos", nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Camera"]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Photos"]) {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else{
        return;
    }
    [self presentViewController:picker animated:YES completion:nil];
    
    //self.imageView.layer.cornerRadius= self.imageView.frame.size.height/2;
    //layer.cornerRadius = cell.yourImageView.frame.size.height /2;
   // self.imageView.layer.masksToBounds = YES;
  //  self.imageView.layer.borderWidth = 0;
    
}



@end
