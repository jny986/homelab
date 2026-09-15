# Homelab

Self-hosted infrastructure for personal use, built on a Proxmox cluster with Docker Compose stacks running on top of it.

## Language

**Node**:
A physical mini PC running Proxmox VE, with a single gigabit NIC shared by LAN, Corosync, and Ceph traffic. The homelab starts with 3 Nodes (`srv1.unicornestate.co`, `srv2.unicornestate.co`, `srv3.unicornestate.co`) and is expected to grow.
_Avoid_: Host, machine, server (when a specific Node is meant, name it)

**Cluster**:
The set of Nodes joined together under Proxmox's clustering (shared management, quorum, live migration). All 3 Nodes are members of one Cluster.

**Docker Host**:
The single VM that runs the existing Docker Compose stacks (`compose/adguard`, `compose/traefik`, `compose/portainer`, `compose/cloudflare-tunnel`, `compose/prind`). One Docker Host serves the whole Cluster; individual Compose stacks are not split across separate guests. It is HA-managed like any other guest and can fail over to any Node.

**Ceph**:
The distributed storage backend spanning a dedicated OSD disk on every Node, used for High Availability: guest disks are replicated across Nodes so a guest can restart on a surviving Node after a Node failure.

**OSD disk**:
The secondary disk on each Node dedicated to Ceph, kept separate from the Node's Proxmox boot disk.

**HA Group**:
The Proxmox High Availability group covering all guests in the Cluster (not just the Docker Host), so any guest added later is HA-managed by default.

**`unicornestate.co`**:
The registered domain used for internal hostnames (e.g. Node FQDNs). Records under it are resolved only on the LAN and are never exposed publicly, regardless of what Traefik/Cloudflare Tunnel expose for services.
