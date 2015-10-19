//
//  NSString+BBStringChecker.h
//  BBStringChecker
//
//  Created by Bryan Boyko on 10/19/15.
//  Copyright © 2015 bryanboyko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BBStringChecker)

/*
 ensures the string contains letters and no decimal characters
 also checks for:
    minLength = 6
    maxLength = 20
    hasUppercase = YES
    hasLowercase = YES
    hadNumbers = NO
*/
 
- (BOOL)isValidPassword;

/* 
 customize your own password criteria!
*/
- (BOOL)isValidPasswordWithMinLength:(int)minLength
                           maxLength:(int)maxLength
                           uppercase:(BOOL)hasUppercase
                           lowercase:(BOOL)hasLowercase
                             numbers:(BOOL)hasNumbers
                          alertsShown:(BOOL)alertsShown;
/* 
 checks for a valid email
*/
- (BOOL)isValidEmail;

/*
 shows an alert if the email is invalid
*/
-(BOOL)isValidEmailWithAlerts:(BOOL)alertsShown;



@end
