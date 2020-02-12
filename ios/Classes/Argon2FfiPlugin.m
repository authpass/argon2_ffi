#import "Argon2FfiPlugin.h"
#if __has_include(<argon2_ffi/argon2_ffi-Swift.h>)
#import <argon2_ffi/argon2_ffi-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "argon2_ffi-Swift.h"
#endif

@implementation Argon2FfiPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftArgon2FfiPlugin registerWithRegistrar:registrar];
}
@end
