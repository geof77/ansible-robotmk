RobotMK ansible role
====================

Manage the RobotMK CheckMK plugin and test suites.

This role requires https://github.com/geof77/ansible-cmk-utils

IMPORTANT NOTES: 

* This is an early version with basic functions.
* Please read the code and run on test servers only. Feedback welcome. 
* Only tested on RHEL 8 with python 3.9

Features
--------

* RobotFramework and RobotMK installation
* Deployment of test suites
* Creation of a service monitoring rule

For CheckMK CEE version:

* Create the agent deployment rule with all the suites
* Bake the agent
* Create a rule for automatic discovery of the test cases

Not implemented yet (PR welcome):

* Creation of the robotmk.yml file for CRE
* Agent deployment for CRE 

Requirements
------------

* cd ansbile/roles; git clone https://github.com/geof77/ansible-cmk-utils cmk-utils
* Install the tribe29.checkmk collection

To use CEE features (optional):
* Agent bakery must be configured (with signing keys, ...)
* Additionnal variables must be set 
* Automatic agent updates should be enabled

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

* tribe29.checkmk >= 0.16.0

Example Playbook
----------------

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

