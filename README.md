<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="medias/logo-sombre.svg">
    <img src="medias/logo-clair.svg" alt="ProxLab" height="56">
  </picture>
</p>

<p align="center"><img src="medias/affiche.png" alt="Banner — ProxLab" width="100%"></p>

# ProxLab

**A modern web dashboard for your Proxmox VE cluster: VMs and containers, consoles, snapshots, backups, uptime and alerts.**

<p align="center">

[![Stars](https://img.shields.io/github/stars/Nesaris/ProxLab?style=flat&logo=github&label=stars)](https://github.com/Nesaris/ProxLab/stargazers)
[![License](https://img.shields.io/badge/license-AGPL--3.0-blue)](LICENSE)
![Node.js 24](https://img.shields.io/badge/Node.js-24-339933?logo=node.js&logoColor=white)
![Zero npm dependencies](https://img.shields.io/badge/npm%20dependencies-0-brightgreen)
![Docker](https://img.shields.io/badge/Docker-ready-2496ED?logo=docker&logoColor=white)
![Self-hosted](https://img.shields.io/badge/self--hosted-yes-orange)
![Proxmox VE](https://img.shields.io/badge/Proxmox-VE-E57000?logo=proxmox&logoColor=white)

</p>

<p align="center"><a href="README.fr.md">Full documentation</a> · <a href="https://nesaris.github.io">Nesaris Network</a></p>

## Why ProxLab?

The Proxmox web UI is powerful but dense. ProxLab gives you a clear, fast overview of your cluster and the everyday actions you actually use, with proper accounts and an audit trail.

## Features

- **Cluster overview** — running guests, storage usage, backups of the last 24 h, cluster network traffic, node health, a 28-night backup calendar and a 7-day hourly uptime map.
- **Machines** — every VM and container across nodes, with metrics, snapshots, backups, config, VM screen (keyboard & mouse), low-latency streamed screen (Sunshine) and text console.
- **Actions** — start, shutdown, reboot, suspend, snapshot, backup; force stop, migrate, rollback and delete for admins, every action signed by its author.
- **Nodes, network, storage & tasks** — interfaces with their MAC addresses, storage content, cluster tasks and logs.
- **Monitoring & alerts** — a VM going down, a lost node or a crossed threshold becomes an event, sent to a signed (HMAC) ticket webhook.
- **Accounts & security** — roles, passkeys, TOTP, security log.

## Screenshots

<table>
<tr><td align="center" width="50%"><img src="medias/capture-1.png" alt="Cluster overview"><br><sub>Cluster overview</sub></td><td align="center" width="50%"><img src="medias/capture-2.png" alt="Machines and containers"><br><sub>Machines and containers</sub></td></tr>
<tr><td align="center" width="50%"><img src="medias/capture-3.png" alt="Machine details"><br><sub>Machine details</sub></td><td align="center" width="50%"><img src="medias/capture-4.png" alt="Snapshots"><br><sub>Snapshots</sub></td></tr>
</table>

## Quick start

```bash
git clone https://github.com/Nesaris/ProxLab && cd ProxLab
cp .env.example .env
mkdir -p secrets && openssl rand -base64 32 > secrets/socle_cle && : > secrets/socle_cle_ancienne
sudo chown 10001:10001 secrets/socle_cle secrets/socle_cle_ancienne && sudo chmod 400 secrets/socle_cle secrets/socle_cle_ancienne
docker compose up -d --build
docker compose logs proxlab | grep "Jeton d'installation"   # one-time setup token
```

The port is only published on localhost: put an HTTPS reverse proxy in front. Or install it from the [Nesaris Hub](https://github.com/Nesaris/Hub) catalog.

Full documentation (configuration, backups, key rotation, reverse proxy, upgrades) is in **[README.fr.md](README.fr.md)**.

## Part of Nesaris Network

ProxLab is one of the self-hosted tools of **[Nesaris Network](https://nesaris.github.io)**. Every service shares the same hardened core (accounts, passkeys, TOTP, audit log, encrypted secrets), runs on Node.js 24 with **zero npm dependencies**, and can be installed in one click from the **[Nesaris Hub](https://github.com/Nesaris/Hub)**.

Other projects: [Hub](https://github.com/Nesaris/Hub) · [MapMyLAN](https://github.com/Nesaris/MapMyLAN) · [NexArc](https://github.com/Nesaris/NexArc) · [Vigie](https://github.com/Nesaris/Vigie) · [Relay](https://github.com/Nesaris/Relay) · [Nesmail](https://github.com/Nesaris/Nesmail) · [Synapse](https://github.com/Nesaris/Synapse) · [Dialekt](https://github.com/Nesaris/Dialekt)

## Contributing

Issues and pull requests are welcome. If ProxLab is useful to you, a ⭐ helps a lot — it's how other people find the project.

## License

[AGPL-3.0-or-later](LICENSE) — made by [CodeX64](https://codexx64.github.io).
