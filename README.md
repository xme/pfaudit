# Introduction
pfaudit is a small project to log all changes applied to a pfSense firewall configuration. pfSense is a firewall solution that provides many features. The management is performed mainly via a web interface. pfSense offers a built-in configuration backup/restore tools but also a configuration history tool to generate diff-alike outputs between different configuration.

I was looking for a way to extract configuration changes and to log them externally for audit reasons. This script fetches a pfSense configuration and compares it to the latest known one. It output all differences in the XML data. Optionally, it dumps the differences in JSON format (to be indexed by a 3rd party tool like ElasticSearch or Splunk).

Example:

# Usage
