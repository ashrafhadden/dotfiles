/// Ash's Firefox Preferences
/// ⚠️ Must have ; semicolons & " double quotes
user_pref("accessibility.force_disabled", 1);
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.gesture.swipe.left", "cmd_scrollRight");
user_pref("browser.gesture.swipe.right", "cmd_scrollRight");
user_pref("dom.targetBlankNoOpener.enabled", true); // https://mathiasbynens.github.io/rel-noopener
user_pref("extensions.pocket.enabled", false);
user_pref("media.autoplay.default", 0);
user_pref("mousewheel.with_meta.action", 1); // 0: Nothing happens 1: Scrolling contents 2: Go back or go forward, in your history 3: Zoom in or out
user_pref("network.security.esni.enabled", true);
user_pref("network.trr.custom_uri", "103.86.96.100");
user_pref("network.trr.enable_when_vpn_detected", true);
user_pref("network.trr.mode", 2); // https://wiki.mozilla.org/Trusted_Recursive_Resolver
user_pref("network.trr.resolvers", "[{}]");
user_pref("network.trr.uri", "103.86.96.100");
user_pref("privacy.trackingprotection.enabled", true);
