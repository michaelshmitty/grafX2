#import <AppKit/AppKit.h>
#import <sys/param.h> /* for MAXPATHLEN */
#import <stdlib.h>

char* getMacosUserFolder(void)
{
    char *result = (char *)malloc(sizeof(char) * (MAXPATHLEN + 1));
    //NSLog(@"Folder: %@", NSHomeDirectoryForUser(NSUserName()));
    NSURL *folder = [NSURL fileURLWithPath:NSHomeDirectory()];
    [[folder path] getCString:result maxLength:MAXPATHLEN encoding:NSUTF8StringEncoding];
    return result;
}
