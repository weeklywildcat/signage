# Wildcat Library Signage

Standalone TypeScript Cloudflare Worker for the Weekly Wildcat library lunch signage.

## Routes

- `GET /view` - public full-screen cafeteria display.
- `GET /api/status` - public read-only status JSON.
- `GET /manage` - Cloudflare Access-protected librarian dashboard.
- `GET /manage/api/status` - Cloudflare Access-protected current status JSON.
- `POST /manage/api/status` - Cloudflare Access-protected status update endpoint.

Cloudflare Access should protect `/manage*`. The Worker does not implement login.

## Setup

1. Install dependencies:

   ```sh
   npm install
   ```

2. Replace `PASTE_DATABASE_ID_HERE` in `wrangler.jsonc` with the D1 database ID for `wildcat-signage`.

3. If the D1 tables are not already present, apply `schema.sql`.

4. Build:

   ```sh
   npm run build
   ```

5. Deploy:

   ```sh
   npm run deploy
   ```

The Cloudflare dashboard owns the custom domain and route setup for `https://signage.weeklywildcat.com`.
