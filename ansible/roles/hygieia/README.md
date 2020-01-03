Role Name
=========

Creates the Hygieia dashboard, mostly following the steps as depicted in:

https://www.devopsart.com/2019/09/step-by-step-installation-of-hygieia.html
https://www.devopsart.com/2019/10/step-by-step-installation-and.html
https://www.devopsart.com/2019/10/step-by-step-installation-and_14.html

The mongodb part is downloaded as a container.

Requirements
------------

Uses git module and python docker sdk.  The installs for these items are within the playbook.  As a to-do, versions are hard-coded, so perhaps I can bring those versions out as variables so it will be easier to update to more current versions as needed

Role Variables
--------------

maven_distro: If you want to change the maven distribution

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
