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

-(BOOL)isValidEmail
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isValidPassword
{
    return [self isValidPasswordWithMinLength:6
                                    maxLength:20
                                    uppercase:NO
                                    lowercase:YES
                                      numbers:NO
                                  alertsShown:NO];
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
    
    NSCharacterSet *numbers = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
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
    
    rang = [self rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]];
    if ( rang.length )
    {
        if (alertsShown) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Characters"
                                                            message:@"Password should only contain letters and numbers"
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
        rang = [self rangeOfCharacterFromSet:numbers];
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
