//
//  NSString+BBStringChecker.m
//  BBStringChecker
//
//  Created by Bryan Boyko on 10/19/15.
//  Copyright © 2015 bryanboyko. All rights reserved.
//

#import "NSString+BBStringChecker.h"
#import <UIKit/UIKit.h>

@implementation NSString (BBStringChecker)

- (BOOL)isValidEmail
{
    return [self isValidEmailWithAlerts:NO];
}

-(BOOL)isValidEmailWithAlerts:(BOOL)alertsShown
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTest evaluateWithObject:self])
    {
        return YES;
    }
    if (alertsShown) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid email"
                                                        message:@"Please enter a valid email address"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    return NO;
}

- (BOOL)isValidPassword
{
    return [self isValidPasswordWithMinLength:6
                                    maxLength:100
                                    uppercase:NO
                                    lowercase:NO
                                      numbers:NO
                                  alertsShown:NO];
}

- (BOOL)isValidPasswordWithAlerts:(BOOL)alertsShown
{
    return [self isValidPasswordWithMinLength:6
                                    maxLength:100
                                    uppercase:NO
                                    lowercase:NO
                                      numbers:NO
                                  alertsShown:YES];
}

- (BOOL)isValidPasswordWithMinLength:(int)minLength
                           maxLength:(int)maxLength
                           uppercase:(BOOL)hasUppercase
                           lowercase:(BOOL)hasLowercase
                             numbers:(BOOL)hasNumbers
                         alertsShown:(BOOL)alertsShown
{
    NSCharacterSet *upperCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLKMNOPQRSTUVWXYZ"];
    NSCharacterSet *lowerCaseChars = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyz"];
    
    if ( [self length]<minLength || [self length]> maxLength)
    {
        if (alertsShown) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid length"
                                                            message:@"Password is either too short or too long"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        return NO;
    }
    
    NSRange rang = [self rangeOfCharacterFromSet:[NSCharacterSet letterCharacterSet]];
    
    if ( !rang.length )
    {
        if (alertsShown) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Letters"
                                                            message:@"Password does not contain any letters"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
        return NO;
    }
    
    if (hasUppercase) {
        rang = [self rangeOfCharacterFromSet:upperCaseChars];
        if ( !rang.length )
        {
            if (alertsShown) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Uppercase"
                                                                message:@"Password does not contain any uppercase letters"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            return NO;
        }
    }
    
    if (hasLowercase) {
        rang = [self rangeOfCharacterFromSet:lowerCaseChars];
        if ( !rang.length )
        {
            if (alertsShown) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Lowercase"
                                                                message:@"Password does not contain any lowercase letters"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            return NO;
        }
    }
    
    if (hasNumbers) {
        rang = [self rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
        if ( !rang.length )
        {
            if (alertsShown) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Numbers"
                                                                message:@"Password does not contain any numbers"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
            }
            return NO;
        }
    }
    
    return YES;
}

@end
