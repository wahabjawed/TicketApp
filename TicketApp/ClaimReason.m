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


UIPickerView *myPickerView;
NSArray *pickerArray;


- (IBAction)submit:(id)sender {
    
    if([self.reasonText.text isEqualToString:@""] || self.reasonText.text == nil){
    
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please tell us why is the ticket unfair by typing the reason" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }else{
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
                                   target:self action:@selector(changeDateFromLabel:)];
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
-(void)changeDateFromLabel:(id)sender
{
    [myPickerView resignFirstResponder];
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
