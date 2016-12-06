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
    NSCharacterSet *setN = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    NSCharacterSet *setL = [NSCharacterSet characterSetWithCharactersInString:@"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"];
    // do validation here
    if (textField==self.NameTextField) {
        if ([self.NameTextField.text isEqualToString:@""])
        {self.title  = @"Please provide you full name"; [self.NameTextField becomeFirstResponder];
        } else {
            NSArray *fullName = [self.NameTextField.text componentsSeparatedByString:@" "];
            if (fullName.count < 2)
            {
                self.title  = @"Please provide your First and Last Name.";
                [self.NameTextField becomeFirstResponder];
            } else {
            
               NSString *dataProvided = self.NameTextField.text;
               if ([dataProvided rangeOfCharacterFromSet:setN].location != NSNotFound)
               {
                   self.title  = @"Please provide your full Name. Numbers are not allowed";
                   [self.NameTextField becomeFirstResponder];
               } else {
                   returnValue = YES;
                   [self.AddressTextField becomeFirstResponder];
                   self.title  = @"";
               }
            }
        }
    }
    
    if (textField==self.AddressTextField) {
        if ([self.AddressTextField.text isEqualToString:@""])
           {self.title  = @"Please provide Street Address"; [self.AddressTextField becomeFirstResponder];
        } else { [self.CityTextField becomeFirstResponder];
            self.title  = @"";
        }
    }
    if (textField==self.CityTextField) {
        if ([self.CityTextField.text isEqualToString:@""])
        {self.title  = @"Please provide City"; [self.CityTextField becomeFirstResponder];
        } else {
                NSString *dataProvided = self.CityTextField.text;
                if ([dataProvided rangeOfCharacterFromSet:setN].location != NSNotFound)
                {
                    self.title  = @"Please provide City. Numbers are not allowed";
                    [self.CityTextField becomeFirstResponder];
                } else {
                    returnValue = YES;
                    [self.StateTextField becomeFirstResponder];
                    self.title  = @"";
                }
        }
    }
    if (textField==self.StateTextField) {
        if ([self.StateTextField.text isEqualToString:@""])
        {self.title  = @"Please provide State"; [self.StateTextField becomeFirstResponder];
        } else {
            NSString *dataProvided = self.StateTextField.text;
            if ([dataProvided rangeOfCharacterFromSet:setN].location != NSNotFound)
            {
                self.title  = @"Please provide State. Numbers are not allowed";
                [self.StateTextField becomeFirstResponder];
            } else {
                returnValue = YES;
                [self.ZipTextField becomeFirstResponder];
                self.title  = @"";
            }
        }
    }
    if (textField==self.ZipTextField) {
        if ([self.ZipTextField.text isEqualToString:@""])
        {self.title  = @"Please provide Zip Code"; [self.ZipTextField becomeFirstResponder];
        } else {
            NSString *dataProvided = self.ZipTextField.text;
            if ([dataProvided rangeOfCharacterFromSet:setL].location != NSNotFound)
            {
                self.title  = @"Please provide Zip Code. Letters are not allowed";
                [self.ZipTextField becomeFirstResponder];
            } else {
                returnValue = YES;
                [self.PhoneTextField becomeFirstResponder];
                self.title  = @"";
            }
        }
    }
    
    if (textField==self.PhoneTextField) {
        if ([self.PhoneTextField.text isEqualToString:@""])
        {self.title  = @"Please provide Phone Number"; [self.PhoneTextField becomeFirstResponder];
        } else {
            NSString *dataProvided = self.PhoneTextField.text;
            if ([dataProvided rangeOfCharacterFromSet:setL].location != NSNotFound)
            {
                self.title  = @"Please provide Phone number. Letters are not allowed";
                [self.PhoneTextField becomeFirstResponder];
            } else {
                returnValue = YES;
                self.title  = @"Job Completed. Thank You!";
                [self.view endEditing:NO];
            }
        }
    }
    return returnValue;
}

// Sample Validation code 
/*
else if (textField == self.streetTextField)
{
    if (![self.streetTextField.text isEqualToString:@""])
    {
        NSArray *streetComponents = [self.streetTextField.text componentsSeparatedByString:@" "];
        if (streetComponents.count == 3)
        {
            NSString *streetNumber = streetComponents[0];
            NSString *streetType = streetComponents[2];
            
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
            if ([streetNumber rangeOfCharacterFromSet:set].location != NSNotFound)
            {
                NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"];
                if ([streetType rangeOfCharacterFromSet:set].location != NSNotFound)
                {
                    returnValue = YES;
                    [self.cityTextField becomeFirstResponder];
                }
            }
        }
    }
    
}

*/

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
