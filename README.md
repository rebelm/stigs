
# stig

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with stig](#setup)
    * [What stig affects](#what-stig-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with stig](#beginning-with-stig)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Puppet module for automatically configuring STIGS, while allowing granular control per STIG

The Module is only planned to implement automatic STIGs for RedHat7, but it is designed to be able to
work for any operating system.

The key benefits for using this module to STIG your RedHat 7 environment:
* Granular - you can turn each STIG off or on by modifying the params.pp manifest
* FAST     - Applying the remediation to a machine takes less than a minute.
* Simple   - Perhaps the most important part, if you have basic Puppet knowledge, you should be able eto explore this module and understand exactly how each STIG fix was implemented.

## Setup

### What stig affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here.

### Beginning with stig

puppet apply /path/to/modules/stigs/examples/init.pp

## Usage

Modify file /path/to/modules/stigs/manifests/redhat7/params.pp.
Each STIG has a variable with the STIG ID as the variable name. Set this value
to 'present' to enable the STIG, or 'absent' to disable.


## Development

I'm not terribly advanced with GIT, so my collaborative skills are lacking. If you
are in the DOD and need

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
=======
# stigs
Puppet module for automatically configuring STIGS, while allowing granular control per STIG

The Module is only planned to implement automatic STIGs for RedHat7, but it is designed to be able to
work for any operating system.
>>>>>>> c806564bd77801e6a4fb9204a0fee46510bc108c
