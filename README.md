# homelab-images

Custom Docker images for homelab, automatically built and published to [ghcr.io](https://ghcr.io) via GitHub Actions.

## Images

### caddy-with-dns

Caddy with DNS challenge plugins for wildcard TLS certificates.

```
ghcr.io/mulinforest/caddy-with-dns:latest
```

**Included plugins:**
- `caddy-dns/alidns` — AliDNS
- `caddy-dns/cloudflare` — Cloudflare
- `caddy-dns/duckdns` — DuckDNS
- `caddy-dns/dynu` — Dynu

---

### frpc-sidecar

frpc with an entrypoint script for env var based configuration. Designed to be used as a sidecar container so services can auto-register to a frps server without maintaining separate config files.

```
ghcr.io/mulinforest/frpc-sidecar:latest
```

**Usage:**
```yaml
services:
  myapp:
    image: myapp:latest

  frpc:
    image: ghcr.io/mulinforest/frpc-sidecar:latest
    environment:
      - FRPS_SERVER=frps.example.com
      - FRPS_TOKEN=your-token
      - FRPS_PORT=7000         # optional, default: 7000
      - SUBDOMAIN=myapp
      - LOCAL_IP=myapp
      - LOCAL_PORT=8080
```

Once started, the service will be accessible at `myapp.<frps-subdomain-host>`.

## CI/CD

Both images are rebuilt daily via GitHub Actions and pushed to ghcr.io. Builds are also triggered on any changes to the respective Dockerfiles.
