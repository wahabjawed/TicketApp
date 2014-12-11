//
//  NewTicket.m
//  TicketApp
//
//  Created by Avialdo on 27/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "NewTicket.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface NewTicket ()

@property (weak, nonatomic) IBOutlet UILabel *PhotoLabel;

@property (weak, nonatomic) IBOutlet UIButton *roundButton;
@end

@implementation NewTicket
NSString *imageName;


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.PhotoLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.PhotoLabel.numberOfLines = 0;
    self.roundButton.layer.cornerRadius=20;
    
    self.navigationController.navigationBar.topItem.title = @"";
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


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSURL *refURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    // define the block to call when we get the asset based on the url (below)
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *imageAsset)
    {
        ALAssetRepresentation *imageRep = [imageAsset defaultRepresentation];
        NSLog(@"[imageRep filename] : %@", [imageRep filename]);
        imageName = [imageRep filename];
        NSLog(@"The image name is: %@", imageName);
    };
    
    // get the asset library and fetch the asset based on the ref url (pass in block above)
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init];
    [assetslibrary assetForURL:refURL resultBlock:resultblock failureBlock:nil];
    
    [self TesseractWork];
    
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
-(void)TesseractWork{
    Tesseract* tesseract = [[Tesseract alloc] initWithLanguage:@"eng+ita"];
    tesseract.delegate = self;
    
    // [tesseract setVariableValue:@"0123456789" forKey:@"tessedit_char_whitelist"]; //limit search
    
    [tesseract setImage:[[UIImage imageNamed:@"tt.jpg"] blackAndWhite]]; //image to check
    //[tesseract setRect:CGRectMake(20, 20, 300, 100)]; //optional: set the rectangle to recognize text in the image
    [tesseract recognize];
    
    NSLog(@"%@", [tesseract recognizedText]);
    
    NSString * text = [tesseract recognizedText];
   
    

    
    tesseract = nil; //deallocate and free all memory
    [self performSegueWithIdentifier:@"go" sender:self];
}


- (BOOL)shouldCancelImageRecognitionForTesseract:(Tesseract*)tesseract
{
    NSLog(@"progress: %d", tesseract.progress);
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}



@end
