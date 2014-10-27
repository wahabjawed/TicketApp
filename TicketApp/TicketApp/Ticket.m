//
//  ViewController.m
//  TicketApp
//
//  Created by Avialdo on 24/10/2014.
//  Copyright (c) 2014 Avialdo. All rights reserved.
//

#import "Ticket.h"

@interface Ticket ()

@property (weak, nonatomic) IBOutlet UIButton *roundButton;


@end

@implementation Ticket

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.roundButton.layer.cornerRadius=20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
