//
//  NewTicket.m
//  TicketApp
//
//  Created by Avialdo on 27/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "NewTicket.h"
#import <AssetsLibrary/AssetsLibrary.h>
<<<<<<< HEAD
=======

>>>>>>> FETCH_HEAD

@interface NewTicket ()

@property (weak, nonatomic) IBOutlet UILabel *PhotoLabel;

@property (weak, nonatomic) IBOutlet UIButton *roundButton;
@end

<<<<<<< HEAD
@implementation NewTicket{
    UIImage *uploadedImage;
    NSString* path;
}
=======
@implementation NewTicket
NSString *imageName;

>>>>>>> FETCH_HEAD

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

<<<<<<< HEAD
=======

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
>>>>>>> FETCH_HEAD
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
    //self.imageView.layer.masksToBounds = YES;
    //self.imageView.layer.borderWidth = 0;

    [self performSegueWithIdentifier:@"go" sender:self];

}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    uploadedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
//    [self.image setImage:uploadedImage];

    
<<<<<<< HEAD
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage]; // imageView is my image from camera
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:savedImagePath atomically:NO];
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    [self getPath];
   
}

-(void)getPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    //UIImage *img = [UIImage imageWithContentsOfFile:getImagePath];
    [self tesseractWork:getImagePath];
}

-(void)tesseractWork:(NSString *) Imagepath{
    
=======

}
-(void)TesseractWork{
>>>>>>> FETCH_HEAD
    Tesseract* tesseract = [[Tesseract alloc] initWithLanguage:@"eng+ita"];
    tesseract.delegate = self;
    
    // [tesseract setVariableValue:@"0123456789" forKey:@"tessedit_char_whitelist"]; //limit search
    
<<<<<<< HEAD
    [tesseract setImage:[UIImage imageNamed:Imagepath]]; //image to check
=======
    [tesseract setImage:[[UIImage imageNamed:@"tt.jpg"] blackAndWhite]]; //image to check
>>>>>>> FETCH_HEAD
    //[tesseract setRect:CGRectMake(20, 20, 300, 100)]; //optional: set the rectangle to recognize text in the image
    [tesseract recognize];
    
    NSLog(@"%@", [tesseract recognizedText]);
    
    NSString * text = [tesseract recognizedText];
   
    

    
    tesseract = nil; //deallocate and free all memory
<<<<<<< HEAD
=======
    [self performSegueWithIdentifier:@"go" sender:self];
>>>>>>> FETCH_HEAD
}

- (BOOL)shouldCancelImageRecognitionForTesseract:(Tesseract*)tesseract
{
    NSLog(@"progress: %d", tesseract.progress);
    return NO;  // return YES, if you need to interrupt tesseract before it finishes
}

@end
