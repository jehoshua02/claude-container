# Rename caveman output style identifier

`caveman:caveman` looks redundant. Investigated — not fixable without Claude Code supporting a vendor/brand prefix separate from plugin name.

## Dropped

The `plugin-name:style-name` format uses the plugin name from plugin.json as the prefix. No way to set a vendor prefix independently. Would require a Claude Code change to support something like a `vendor` field in plugin.json.
