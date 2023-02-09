RobotMK ansible role
====================

Manage the RobotMK CheckMK plugin.

IMPORTANT NOTES: 

* !!! This is a very early version! Run only on test servers and at your own risk!

* This role requires https://github.com/geof77/ansible-cmk-utils

Features
--------

* Install robotframework (pip install)
* Download and install the Robot MK .mkp
* Automatically deploy the test suites it finds in the robot directory

For CheckMK CEE version:

* Create the agent deployment rule with all the suites
* Bake the agent
* Create a rule for automatic discovery of the test cases

Requirements
------------

* cd ansbile/roles; git clone https://github.com/geof77/ansible-cmk-utils cmk-utils
* Install the tribe29.checkmk collection

To use CEE features (optional):
* Agent bakery must be configured (with signing keys, ...)
* Automatic updates should be enabled

Role Variables
--------------

* https_proxy: proxy to download the robotmk mkp
* cmk_site_name: CheckMK site name
* cmk_server_url: URL of the CheckMK server
* robotmk_version: "1.4.1"
* robotmk_suites: a list of suite names you want to deploy from the role's files/ directory.

For CEE features (agent bakery):
* cmk_agent_key_id: the agent key id
* cmk_agent_key_pw: the agent key password 

Dependencies
------------

* tribe29.checkmk >= 0.17.0

Example Playbook
----------------

Have a look at the test directory.

    - hosts: checkmk

      collections:
        - tribe29.checkmk

      vars:
        https_proxy: http://proxy.example.com:8000
        cmk_site_name: test
        cmk_server_url: http://test.example.com/test/check_mk
        cmk_agent_key_id: 1
        cmk_agent_key_pw: secret
        robotmk_version: "1.4.1"
        robotmk_suites:
          - testsuite

      roles:
         - robotmk

