//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <argon2_ffi/argon2_ffi_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) argon2_ffi_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "Argon2FfiPlugin");
  argon2_ffi_plugin_register_with_registrar(argon2_ffi_registrar);
}
