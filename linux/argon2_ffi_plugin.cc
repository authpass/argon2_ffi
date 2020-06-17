#include "include/argon2_ffi/argon2_ffi_plugin.h"

#include <flutter_linux/flutter_linux.h>
#include <gtk/gtk.h>
#include <sys/utsname.h>

#define ARGON2_FFI_PLUGIN(obj) \
  (G_TYPE_CHECK_INSTANCE_CAST((obj), argon2_ffi_plugin_get_type(), \
                              Argon2FfiPlugin))

struct _Argon2FfiPlugin {
  GObject parent_instance;
};

G_DEFINE_TYPE(Argon2FfiPlugin, argon2_ffi_plugin, g_object_get_type())

// Called when a method call is received from Flutter.
static void argon2_ffi_plugin_handle_method_call(
    Argon2FfiPlugin* self,
    FlMethodCall* method_call) {
  g_autoptr(FlMethodResponse) response = nullptr;

  response = FL_METHOD_RESPONSE(fl_method_not_implemented_response_new());

  fl_method_call_respond(method_call, response, nullptr);
}

static void argon2_ffi_plugin_dispose(GObject* object) {
  G_OBJECT_CLASS(argon2_ffi_plugin_parent_class)->dispose(object);
}

static void argon2_ffi_plugin_class_init(Argon2FfiPluginClass* klass) {
  G_OBJECT_CLASS(klass)->dispose = argon2_ffi_plugin_dispose;
}

static void argon2_ffi_plugin_init(Argon2FfiPlugin* self) {}

static void method_call_cb(FlMethodChannel* channel, FlMethodCall* method_call,
                           gpointer user_data) {
  Argon2FfiPlugin* plugin = ARGON2_FFI_PLUGIN(user_data);
  argon2_ffi_plugin_handle_method_call(plugin, method_call);
}

void argon2_ffi_plugin_register_with_registrar(FlPluginRegistrar* registrar) {
  Argon2FfiPlugin* plugin = ARGON2_FFI_PLUGIN(
      g_object_new(argon2_ffi_plugin_get_type(), nullptr));

  g_autoptr(FlStandardMethodCodec) codec = fl_standard_method_codec_new();
  g_autoptr(FlMethodChannel) channel =
      fl_method_channel_new(fl_plugin_registrar_get_messenger(registrar),
                            "argon2_ffi",
                            FL_METHOD_CODEC(codec));
  fl_method_channel_set_method_call_handler(channel, method_call_cb,
                                            g_object_ref(plugin),
                                            g_object_unref);

  g_object_unref(plugin);
}
