# Graph Report - bold-llama  (2026-09-15)

## Corpus Check
- Corpus is ~1,443 words - fits in a single context window. You may not need a graph.

## Summary
- 31 nodes · 35 edges · 5 communities
- Extraction: 91% EXTRACTED · 6% INFERRED · 3% AMBIGUOUS · INFERRED: 2 edges (avg confidence: 0.95)
- Token cost: 40,686 input · 0 output

## Community Hubs (Navigation)
- Public Ingress & Printer UI
- Reverse Proxy & Admin Tools
- Domain Modeling Docs
- Issue Tracker Workflow
- 3D Printer Core Stack

## God Nodes (most connected - your core abstractions)
1. `traefik service` - 11 edges
2. `proxy network (traefik, defined)` - 4 edges
3. `Domain Docs agent doc` - 4 edges
4. `Issue Tracker agent doc` - 4 edges
5. `adguard service` - 3 edges
6. `portainer service` - 3 edges
7. `moonraker service` - 3 edges
8. `GitHub Issues (via gh CLI)` - 3 edges
9. `proxy network (adguard, external)` - 2 edges
10. `tunnel service (cloudflared)` - 2 edges

## Surprising Connections (you probably didn't know these)
- `homelab (repo)` --conceptually_related_to--> `traefik service`  [AMBIGUOUS]
  README.md → compose/traefik/compose.yml
- `Issue Tracker (AGENTS.md skill)` --references--> `Issue Tracker agent doc`  [EXTRACTED]
  AGENTS.md → docs/agents/issue-tracker.md
- `Domain Docs (AGENTS.md skill)` --references--> `Domain Docs agent doc`  [EXTRACTED]
  AGENTS.md → docs/agents/domain.md
- `traefik service` --routes_to--> `adguard service`  [EXTRACTED]
  compose/traefik/compose.yml → compose/adguard/compose.yml
- `proxy network (adguard, external)` --references--> `proxy network (traefik, defined)`  [INFERRED]
  compose/adguard/compose.yml → compose/traefik/compose.yml

## Import Cycles
- None detected.

## Hyperedges (group relationships)
- **Services routed through traefik reverse proxy** — compose_traefik_compose_traefik, compose_adguard_compose_adguard, compose_portainer_compose_portainer, compose_prind_compose_moonraker, compose_prind_compose_webcam, compose_prind_compose_fluidd [INFERRED 0.85]
- **Public ingress path: cloudflare tunnel -> traefik -> internal services** — compose_cloudflare_tunnel_compose_tunnel, compose_traefik_compose_traefik, compose_adguard_compose_adguard, compose_portainer_compose_portainer [INFERRED 0.85]
- **prind 3D printer management stack** — compose_prind_compose_klipper, compose_prind_compose_moonraker, compose_prind_compose_webcam, compose_prind_compose_fluidd, compose_prind_compose_init [EXTRACTED 0.90]

## Communities (5 total, 0 thin omitted)

### Community 0 - "Public Ingress & Printer UI"
Cohesion: 0.25
Nodes (9): public-tunnel network (cloudflare-tunnel), tunnel service (cloudflared), fluidd service, webcam service (ustreamer), public-tunnel network (traefik, external), traefik service, traefik API/dashboard, letsEncrypt certificate resolver (Cloudflare DNS challenge) (+1 more)

### Community 1 - "Reverse Proxy & Admin Tools"
Cohesion: 0.25
Nodes (8): adguard service, adguard volume, proxy network (adguard, external), portainer service, portainer-data volume, proxy network (portainer, external), proxy network (traefik, defined), traefik docker provider (proxy network, watch)

### Community 2 - "Domain Modeling Docs"
Cohesion: 0.40
Nodes (6): Domain Docs (AGENTS.md skill), Domain Docs agent doc, Architecture Decision Records (docs/adr), CONTEXT-MAP.md, CONTEXT.md, /domain-modeling skill

### Community 3 - "Issue Tracker Workflow"
Cohesion: 0.60
Nodes (5): Issue Tracker (AGENTS.md skill), Issue Tracker agent doc, GitHub Issues (via gh CLI), PRs as triage surface, Wayfinding operations (/wayfinder)

### Community 4 - "3D Printer Core Stack"
Cohesion: 1.00
Nodes (3): init service (busybox chown), klipper service, moonraker service

## Ambiguous Edges - Review These
- `homelab (repo)` → `traefik service`  [AMBIGUOUS]
  README.md · relation: conceptually_related_to

## Knowledge Gaps
- **10 isolated node(s):** `Issue Tracker (AGENTS.md skill)`, `Domain Docs (AGENTS.md skill)`, `homelab (repo)`, `adguard volume`, `portainer-data volume` (+5 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 11 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What is the exact relationship between `homelab (repo)` and `traefik service`?**
  _Edge tagged AMBIGUOUS (relation: conceptually_related_to) - confidence is low._
- **Why does `traefik service` connect `Public Ingress & Printer UI` to `Reverse Proxy & Admin Tools`, `3D Printer Core Stack`?**
  _High betweenness centrality (0.341) - this node is a cross-community bridge._
- **Why does `moonraker service` connect `3D Printer Core Stack` to `Public Ingress & Printer UI`?**
  _High betweenness centrality (0.078) - this node is a cross-community bridge._
- **Why does `proxy network (traefik, defined)` connect `Reverse Proxy & Admin Tools` to `Public Ingress & Printer UI`?**
  _High betweenness centrality (0.077) - this node is a cross-community bridge._
- **Are the 2 inferred relationships involving `proxy network (traefik, defined)` (e.g. with `proxy network (adguard, external)` and `proxy network (portainer, external)`) actually correct?**
  _`proxy network (traefik, defined)` has 2 INFERRED edges - model-reasoned connections that need verification._
- **What connects `Issue Tracker (AGENTS.md skill)`, `Domain Docs (AGENTS.md skill)`, `homelab (repo)` to the rest of the system?**
  _10 weakly-connected nodes found - possible documentation gaps or missing edges._