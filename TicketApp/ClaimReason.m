//
//  ClaimReason.m
//  TicketApp
//
//  Created by Avialdo on 28/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "ClaimReason.h"

@interface ClaimReason ()

@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@property (weak, nonatomic) IBOutlet UILabel *explainLabel;
@property (weak, nonatomic) IBOutlet UITextView *reasonText;

@end

@implementation ClaimReason

UIActivityIndicatorView *progress;
UIView *_hudView;
UILabel *_captionLabel;

UIPickerView *myPickerView;
NSArray *pickerArray;


- (IBAction)submit:(id)sender {
    
    if([self.reasonText.text isEqualToString:@""] || self.reasonText.text == nil){
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please tell us why is the ticket unfair by typing the reason" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
        
//        _hudView = [[UIView alloc] initWithFrame:CGRectMake(75, 155, 170, 100)];
//        _hudView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
//        _hudView.clipsToBounds = YES;
//        _hudView.layer.cornerRadius = 10.0;
        
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        progress.frame = CGRectMake(100, 200, 100, 150);
        [progress setBackgroundColor:[UIColor grayColor]];
        [progress setColor:[UIColor whiteColor]];
        //[_hudView addSubview:progress];
        
        
        _captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 130, 22)];
        _captionLabel.backgroundColor = [UIColor clearColor];
        _captionLabel.textColor = [UIColor whiteColor];
        _captionLabel.adjustsFontSizeToFitWidth = YES;
        _captionLabel.textAlignment = NSTextAlignmentCenter;
        _captionLabel.text = @"Submitting your claim...";
        [progress addSubview:_captionLabel];
        [self.view addSubview:progress];
        [progress startAnimating];
        //[_hudView addSubview:_captionLabel];
        
        //[self.view addSubview:_hudView];
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.topItem.title = @"";
    self.explainLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.explainLabel.numberOfLines = 0;
    [self addPickerView];
    
    
    
    
  //  [self.view removeFromSuperview:_hudView];
    
    //[self.view addSubview:progress];
   // [progress bringSubviewToFront:self.view];
    //[progress startAnimating];
    
}

-(void)addPickerView{
    pickerArray = [[NSArray alloc]initWithObjects:@"Meter malfunction",
                   @"Meter paid",@"Missing or obscured sign",@"stolen vehicle",@"Sold/ Not owned vehicle"@"Valid permit",@"Other",@"Paying ticket in full", nil];
  
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.delegate = self;
    [self.myTextField setPlaceholder:@"Pick a Sport"];
    myPickerView = [[UIPickerView alloc]init];
    myPickerView.dataSource = self;
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done" style:UIBarButtonItemStyleBordered
                                   target:self action:@selector(hidePicker:)];
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:
                          CGRectMake(0, self.view.frame.size.height-
                                     myPickerView.frame.size.height-50, 320, 50)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    NSArray *toolbarItems = [NSArray arrayWithObjects:
                             doneButton, nil];
    [toolBar setItems:toolbarItems];
    self.myTextField.inputView = myPickerView;
    self.myTextField.inputAccessoryView = toolBar;
    
}

#pragma mark - Text field delegates
-(void)hidePicker:(id)sender
{
    [myPickerView removeFromSuperview];
    
   // [myPickerView resignFirstResponder];
}
#pragma mark - Picker View Data source
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    return [pickerArray count];
}

#pragma mark- Picker View Delegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component{
    [self.myTextField setText:[pickerArray objectAtIndex:row]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:
(NSInteger)row forComponent:(NSInteger)component{
    return [pickerArray objectAtIndex:row];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
