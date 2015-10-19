# BBStringChecker
A category on NSString that validates email or password strings

Valid Password
--

```
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
```

NOTE: Setting alertsShown to yes will display an alert message for failing criteria

Valid Email
--

Checks for [string],[@], and [.com]

```
- (BOOL)isValidEmail;
```


