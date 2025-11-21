# n8n - Ready-to-Deploy GitHub Repo (Beginner-friendly)

This repository contains a minimal setup to deploy n8n via Docker (suitable for Railway or any Docker-based host).
It includes a `Dockerfile`, a `docker-compose.yml` for local testing, and an `.env.example`.

## Quick Steps (Railway - GitHub deployment)

1. Create a new GitHub repository (public or private) and push the contents of this folder.
   - Example:
     ```
     git init
     git add .
     git commit -m "n8n repo"
     git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
     git push -u origin main
     ```

2. On Railway:
   - Create a new project -> Connect to GitHub repo (the one you just pushed).
   - Railway will detect the Dockerfile and build the container.
   - After deploy, open the project URL.

3. Environment variables to set in Railway (Project -> Variables):
   - N8N_BASIC_AUTH_USER = pick a username
   - N8N_BASIC_AUTH_PASSWORD = pick a strong password
   - WEBHOOK_TUNNEL_URL = https://YOUR_RAILWAY_SUBDOMAIN (if you want correct webhook URLs)
   - If you use Railway Postgres plugin, set DATABASE_URL or DB_POSTGRESDB_* values accordingly.

4. Optional: Add Railway Postgres plugin (recommended) and set `DATABASE_URL` to the plugin value.
   - If `DATABASE_URL` is present, n8n will use Postgres; otherwise it will use SQLite.

5. Open n8n URL and login with the basic auth credentials you created.

## Local testing with Docker Compose

- Install Docker & Docker Compose.
- Copy `.env.example` to `.env` and adjust values.
- Run:
  ```
  docker-compose up -d
  ```
- Visit http://localhost:5678 and login with the credentials in `.env`.

## Next steps after n8n is live

- Add credentials (OpenAI / ElevenLabs / Google OAuth) in the UI (Credentials -> New).
- Create a "Test" workflow to call OpenAI and ElevenLabs to verify API connectivity.
- I'll guide you step-by-step to create the exact workflows for script generation, TTS, FFmpeg processing and uploads.

## Notes & Troubleshooting

- If Railway blocks template deployments, this repo approach uses your GitHub push and works with free plans.
- If you prefer a managed provider (Render, Fly.io), the Dockerfile will work there too.
