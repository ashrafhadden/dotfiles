/// Ash's Firefox Preferences
/// ⚠️ Must have ; semicolons & " double quotes
// Appearance
user_pref("browser.in-content.dark-mode", true);
// GUI Settings
user_pref("font.default.el", "Ubuntu");
user_pref("font.name-list.monospace.el", "Ubuntu Mono Nerd Lig");
user_pref("font.name-list.monospace.x-math", "Ubuntu Mono Nerd Lig");
user_pref("font.name-list.monospace.x-unicode", "Ubuntu Mono Nerd Lig");
user_pref("font.name-list.proportional.el", "Ubuntu");
user_pref("font.name-list.proportional.unicode", "Ubuntu");
user_pref("font.name-list.proportional.x-math", "Ubuntu");
user_pref("font.name-list.sans-serif.el", "Ubuntu");
user_pref("font.name-list.sans-serif.unicode", "Ubuntu");
user_pref("font.name-list.sans-serif.x-math", "Ubuntu");
user_pref("font.name-list.serif.el", "Ubuntu");
user_pref("font.name-list.serif.unicode", "Ubuntu");
user_pref("font.name-list.serif.x-math", "Ubuntu");
user_pref("font.name.monospace.x-western", "Ubuntu Mono Nerd Lig");
user_pref("font.name.sans-serif.x-western", "Ubuntu");
user_pref("font.name.serif.x-western", "Ubuntu");
user_pref("browser.contentblocking.category", "strict");
user_pref("identity.fxaccounts.account.device.name", "Mac");
// Annoyances
user_pref("browser.gesture.swipe.left", "cmd_scrollRight");
user_pref("browser.gesture.swipe.right", "cmd_scrollRight");
user_pref("extensions.pocket.enabled", false);
user_pref("mousewheel.with_meta.action", 1); // 0: Nothing happens 1: Scrolling contents 2: Go back or go forward, in your history 3: Zoom in or out
// Security
user_pref("network.security.esni.enabled", true);
user_pref("network.trr.custom_uri", "103.86.96.100"); // DoH (DNS over HTTPS) using NordVPN DNS Servers, check with about:networking#dns
user_pref("network.trr.enable_when_nrpt_detected", 1);
user_pref("network.trr.enable_when_proxy_detected", 1);
user_pref("network.trr.enable_when_vpn_detected", true);
user_pref("network.trr.mode", 2); // https://wiki.mozilla.org/Trusted_Recursive_Resolver
user_pref("network.trr.resolvers", '[{ "name": "Cloudflare", "url": "https://mozilla.cloudflare-dns.com/dns-query" }, { "name": "NordVPN", "url": "103.86.96.100" }]');
user_pref("network.trr.resolvers", "[{}]");
user_pref("network.trr.uri", "103.86.96.100");
user_pref("privacy.trackingprotection.enabled", true);
// Privacy & Anonymity
// user_pref("toolkit.telemetry.enabled", 1);
user_pref("privacy.resistFingerprinting", false);
user_pref("privacy.window.maxInnerHeight", 800);
user_pref("privacy.window.maxInnerWidth", 1280);
// user_pref("window.devicePixelRatio", 2); // fixes side-effect of resistFingerprinting https://bugzilla.mozilla.org/show_bug.cgi?id=1554751