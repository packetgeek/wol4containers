# Wake on LAN for VMs and Docker Containers

> **Warning** - ***This is an incomlete work-in-progress.***

This is a proof of concept that takes advantage of Guacamole's WOL feature, which now allows you to set the target port, allowing you to have an additional WOL architecture, separate from your normal one.  With this, Docker containers will be started when you attempt to connect to them with Guacamole.

## Goal

Have a WOL service which will start VMs or Docker containers, based on their MAC addresses. Primary use would be to leverage Guacamole's wake-on-lan feature to start a VM or Docker container on the local or remote host.

wol4containers takes advantage of Guacamole's WOL feature, which now allows you to set the target port, allowing you to have an additional WOL architecture, separate from your normal one.

## Features

* Allow use of "standard" WOL tools to start a VM or Docker container.
* The MAC addresses don't have to actually correlated to specific VMs or Docker container (will need a mapping of MAC to command in a config file).
* Listens on configurable port (to avoid using ports 6, 7, or 9, which are used by "real" WOL services).
* Doesn't conflict with other methods for starting/stopping your containers or VMs.

## Assumptions

* wol4containers is installed on the host for the hypervisor (for VMs) or Docker (for containers)
* Docker commands are run at the user level, not as root.
* Assumes that you're using a version of Guacamole (e.g., v1.4.0) that allows you to set the port for WOL.  Note: it should work on older versions of Guacamole but may conflict with "normal" WOL if you're using WOL to remotely start the Guacamole host.
* This is meant for the home lab environment, or for environments where countermeasures are sufficient to prevent abuse of WOL-type services. (I take no responsibility if you're system gets abused!).
* You use a "range" of MAC addresses that have nothing to do with the hardware in your architecture, unless you want to be able to start normally-off hardware for remote access.

## Guacamole config

## To do

* Create systemd config for automatically starting/stopping wol4containers as a service
* Better documentation
* Possibly incorporate Sleep-On-LAN 
* Expand discussion on choosing MAC addresses to employ.

## References

* https://github.com/SR-G/sleep-on-lan
* https://forum.proxmox.com/threads/wake-on-lan-for-vm.84355/
* https://forum.proxmox.com/threads/update-wake-and-other-on-lan-for-vms-v0-3.26381/
