# Find and Replace in Chrome
A tiny JS script and a tiny JSON file in a directory is all you need to
create an extension that replaces HTML with HTML. 

## How to use
Download the files to a directory and load it as unpacked in
`chrome://extensions`. Replace `"matches"` in `manifest.json` to target
a particular website, or use patterns to target a wide range of URLs. As an
example, `"matches": ["*://*/*"],` targets all URLs.
