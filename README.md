# Introduction
pfaudit is a small project to log all changes applied to a pfSense firewall configuration. pfSense is a firewall solution that provides many features. The management is performed mainly via a web interface. pfSense offers a built-in configuration backup/restore tools but also a configuration history tool to generate diff-alike outputs between different configuration.

I was looking for a way to extract configuration changes and to log them externally for audit reasons. This script fetches a pfSense configuration and compares it to the latest known one. It output all differences in the XML data. Optionally, it dumps the differences in JSON format (to be indexed by a 3rd party tool like ElasticSearch or Splunk).

Examples:

A new static lease has been added to the DHCP server:

    # /pfaudit.py -H pfsense.lan -u root -k /data/id_rsa -v
    Connecting to ssh://root@pf0.lan
    Dumping configuration to /tmp/tmpa9724grw
    Processing /tmp/tmpa9724grw
    Firewall hostname: pfsense
    Writing encrypted configuration to pfsense.lan.conf
    Comparing configurations: Old SHA256: 982b1a48d479892acc407372e46be2bd4d19a2eb967967ede707611f7e4dd7ef, New SHA256: 89ec148591d26bb12db4753acf4a711ad08620c40421ef1a2ed2ff77c6ef5f41
    Changes in root
    Changes in dhcpd
    Changes in lan
    Changes in staticmap
    Changes in 0
    Key 'mac' changed to '58:ef:68:7a:7b:7c'
    Key 'cid' changed to 'Test pfaudit.py'
    Key 'ipaddr' changed to '192.168.254.34'
    Key 'hostname' changed to 'None'
    Key 'descr' changed to 'None'
    Changes in revision
    Key 'time' changed to '1607432545'

# Usage
    # /pfaudit.py -h
    Usage: pfaudit.py [options]

    Options:
        --version             show program's version number and exit
        -h, --help            show this help message and exit
        -u SSH_USER, --user=SSH_USER
                              SSH user
        -H SSH_HOST, --host=SSH_HOST
                              Firewall FQDN or IP address
        -k KEY_FILE, --key=KEY_FILE
                              SSH RSA private key
        -p KEY_PASSPHRASE, --passphrase=KEY_PASSPHRASE
                              SSH key passphrase
        -j, --json            Generate JSON logfile
        -l LOG_FILE, --log=LOG_FILE
                              Local log file (default: stdout)
        -v, --verbose         Verbose output
  
