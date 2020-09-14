#import "PersianPushPlugin.h"
#if __has_include(<persian_push/persian_push-Swift.h>)
#import <persian_push/persian_push-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "persian_push-Swift.h"
#endif

@implementation PersianPushPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPersianPushPlugin registerWithRegistrar:registrar];
}
@end
