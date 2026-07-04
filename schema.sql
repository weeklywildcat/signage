CREATE TABLE IF NOT EXISTS library_status (
  id INTEGER PRIMARY KEY,
  status TEXT NOT NULL CHECK (status IN ('open', 'capacity', 'closed')),
  message TEXT NOT NULL DEFAULT '',
  updated_at TEXT NOT NULL,
  updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS library_status_history (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  status TEXT NOT NULL CHECK (status IN ('open', 'capacity', 'closed')),
  message TEXT NOT NULL DEFAULT '',
  updated_at TEXT NOT NULL,
  updated_by TEXT NOT NULL
);

INSERT INTO library_status (id, status, message, updated_at, updated_by)
VALUES (1, 'closed', '', strftime('%Y-%m-%dT%H:%M:%fZ', 'now'), 'Library staff')
ON CONFLICT(id) DO NOTHING;
