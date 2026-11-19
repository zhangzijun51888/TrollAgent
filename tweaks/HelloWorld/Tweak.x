#import <UIKit/UIKit.h>

static void showHello(void) {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *keyWindow = nil;
        for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
            if (![scene isKindOfClass:[UIWindowScene class]]) continue;
            for (UIWindow *w in ((UIWindowScene *)scene).windows) {
                if (w.isKeyWindow) { keyWindow = w; break; }
            }
        }
        UIViewController *root = keyWindow.rootViewController;
        if (!root) return;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"HelloWorld"
                                                                      message:@"tweak injected OK"
                                                               preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
        [root presentViewController:alert animated:YES completion:nil];
    });
}

%hook SpringBoard
- (void)applicationDidFinishLaunching:(id)application {
    %orig;
    showHello();
}
%end
