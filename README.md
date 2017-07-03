# README #

This repository is used to store all our monitors templates. 

These templates have to be used with dedicated agent configurations and ressource tagging to works as expected.

### How to contribute ? ###

The easiest way to contribute on this repository is to add monitors file inside the monitors repository.

### Important notes ###

*This repository will be included as a Terraform module source.
 
*Each monitors have to be disabled by default, so you have to manage this condition when you create your monitors.

*If you override a basic monitor with a custom one, you have to use tag filters on you query. (Example dd_cpu_high, if you want to override default cpu monitors)
