
# stigs - INCOMPLETE ( ETC 6/1/17 )

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
* Granular - you can turn each STIG off or on by modifying the manifests/redhat7/params.pp manifest
* FAST     - Applying the module takes less than a minute (First time use may be longer due to software package installation/removal)
* Simple   - Perhaps the most important part, if you have basic Puppet knowledge, you should be able to explore this module and understand exactly how each STIG fix was implemented.
* Organized - I have Puppet to thank for this, as it naturally forces you to organize your modules and manifests. I have implemented each fix to a STIG in a single manifest file, whose name file name is equal to the STIG Id.
* Maintain compliance - Being a Puppet based solution, all you need to do is add this module to your default node definition. All the nodes will be put in compliance, and stay in compliance based on your Puppet client run interval.

Why not Openscap?

I spent a lot of time debating if I want to build my own solution, or utilize Openscap remediation scripts. Ultimately, I decided to develop my own solution for the following reasons:

* Incomplete - OpenScap has only released the draft STIG, and I am not aware of when Ver 1, Rel 1 will be put out. We can't upgrade machines from RedHat 6 to 7 until we have a solution for stigging the machines ( and find a work around for lack of support for direct upgrade paths cough cough). My Puppet solution isn't complete yet, but I expect mine to be finished quicker than OpenScap.
* OpenScap implementation isn't very clear. Security policies aren't very clear in general (Why is there two stigs for modifying the same line??). This Puppet based solution is blatantly clear in it's implementation. When you're making 235 distinct changes to all your operating systems, I believe you should know exactly what it is that each fix is doing. 
* Speed. Building each manifest to be idempotent allows for the entire machine to be checked blazing fast.
* 
## Setup

### Beginning with stigs

puppet apply /path/to/modules/stigs/examples/init.pp

## Usage

Modify file /path/to/modules/stigs/manifests/redhat7/params.pp.
Each STIG has a variable with the STIG ID as the variable name. Set this value
to 'present' to enable the STIG, or 'absent' to disable.

## Development

I'm not terribly advanced with GIT, so my collaborative skills are lacking. Email me at lukepafford@gmail.com if you have any questions

