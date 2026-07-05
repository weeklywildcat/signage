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

CREATE TABLE IF NOT EXISTS library_open_schedule (
  id INTEGER PRIMARY KEY CHECK (id = 1),
  opens_at TEXT,
  time_value TEXT,
  updated_at TEXT NOT NULL,
  updated_by TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS library_opening_presets (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  time_value TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  created_at TEXT NOT NULL,
  created_by TEXT NOT NULL
);

INSERT INTO library_status (id, status, message, updated_at, updated_by)
VALUES (1, 'closed', '', strftime('%Y-%m-%dT%H:%M:%fZ', 'now'), 'Library staff')
ON CONFLICT(id) DO NOTHING;

INSERT INTO library_open_schedule (id, opens_at, time_value, updated_at, updated_by)
VALUES (1, NULL, NULL, strftime('%Y-%m-%dT%H:%M:%fZ', 'now'), 'Library staff')
ON CONFLICT(id) DO NOTHING;
