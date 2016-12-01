//
//  StowberryTableViewController.m
//  Sample Form
//
//  Created by Marco Almeida on 12/1/16.
//  Copyright © 2016 THE IRON YARD. All rights reserved.
//

#import "StowberryTableViewController.h"

@interface StowberryTableViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *NameTextField;
@property (weak, nonatomic) IBOutlet UITextField *AddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *CityTextField;
@property (weak, nonatomic) IBOutlet UITextField *StateTextField;
@property (weak, nonatomic) IBOutlet UITextField *ZipTextField;
@property (weak, nonatomic) IBOutlet UITextField *PhoneTextField;


@end

@implementation StowberryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
 // calls this method when user press the "enter" buttom


{
    BOOL returnValue =NO;
    [self.view endEditing:YES];
    if (textField==self.NameTextField)
        // if the textfield in question is the bandNameTextField
    {
    // do validation here
        if ([self.NameTextField.text isEqualToString:@""]) {
            //if field is empty
            self.title  = @"Please provide full name";
            [self.NameTextField becomeFirstResponder];
//            self.NameTextField.textColor = [UIColor whiteColor];
//            self.NameTextField.backgroundColor = [UIColor redColor];
//            self.NameTextField.text  = @"Please provide full name";
        } else {
            [self.AddressTextField becomeFirstResponder];
            // [self.bandNameTextField becomeFirstResponder];
            // becomeFirstResponder tells the system to place cursor in the field given name here
            // Use this to move to the next field
        }
    }
    if (textField==self.AddressTextField) {
        if ([self.AddressTextField.text isEqualToString:@""])
           {self.title  = @"Please provide Street Address"; [self.AddressTextField becomeFirstResponder];
        } else { [self.CityTextField becomeFirstResponder];}
    }
    if (textField==self.CityTextField) {
        if ([self.CityTextField.text isEqualToString:@""])
        {self.title  = @"Please provide City"; [self.CityTextField becomeFirstResponder];
        } else { [self.StateTextField becomeFirstResponder];}
    }
    if (textField==self.StateTextField) {
        if ([self.StateTextField.text isEqualToString:@""])
        {self.title  = @"Please provide State"; [self.StateTextField becomeFirstResponder];
        } else { [self.ZipTextField becomeFirstResponder];}
    }
    if (textField==self.ZipTextField) {
        if ([self.ZipTextField.text isEqualToString:@""])
        {self.title  = @"Please provide Zip Code"; [self.ZipTextField becomeFirstResponder];
        } else { [self.PhoneTextField becomeFirstResponder];}
    }
    if (textField==self.PhoneTextField) {
        if ([self.PhoneTextField.text isEqualToString:@""])
            {self.title  = @"Please provide Phone Number"; [self.PhoneTextField becomeFirstResponder];
        } else {
 //           [self.PhoneTextField becomeFirstResponder];
        self.title  = @"Job Completed. Thank You!";
        [self.view endEditing:NO];
        }
    }

    return returnValue;
}



#pragma mark - Table view data source



/*  The following not needed because this is a static form
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

*/
 
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
