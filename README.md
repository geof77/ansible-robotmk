RobotMK
=========

Manage the RobotMK CheckMK plugin.

IMPORTANT NOTE: !!! This is a very early version! Run only on test servers and at your own risk!

Requirements
------------

* A working CheckMK test server (CEE edition only)
* Agent bakery must be configured
* Automatic updates must be enabled
* The test suite directories under files/robot/ are deployed autmatically

Role Variables
--------------

* https_proxy: proxy to download the robotmk mkp
* cmk_site_name: CheckMK site name
* cmk_server_url: URL of the CheckMK server
* robotmk_version: "1.4.1"

For agent bakery:
* cmk_agent_key_id: the agent key id
* cmk_agnet_key_pw: the agent key password 

Dependencies
------------

* tribe29.checkmk

Example Playbook
----------------

Have a look at the test directory.

    - hosts: checkmk
      vars:
        https_proxy: http://proxy.example.com:8000
        cmk_site_name: test
        cmk_server_url: http://test.example.com/test/check_mk
        robotmk_version: "1.4.1"
      roles:
         - robotmk


License
-------

Proprietary (unreleased)

Author Information
------------------

Geoffroy Stévenne

