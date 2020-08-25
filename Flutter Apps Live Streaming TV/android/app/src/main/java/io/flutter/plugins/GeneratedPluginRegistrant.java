package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.github.tcking.gplayer.GPlayerPlugin;
import flutter.plugins.screen.screen.ScreenPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    GPlayerPlugin.registerWith(registry.registrarFor("com.github.tcking.gplayer.GPlayerPlugin"));
    ScreenPlugin.registerWith(registry.registrarFor("flutter.plugins.screen.screen.ScreenPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
