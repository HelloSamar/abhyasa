-- Abhyasa: Practice. Prepare. Perform.
-- Schema (SQLite / PostgreSQL compatible)

CREATE TABLE categories (
  category_id   INTEGER PRIMARY KEY,
  category_name TEXT NOT NULL
);

CREATE TABLE sources (
  source_id   INTEGER PRIMARY KEY,
  category_id INTEGER NOT NULL
    REFERENCES categories(category_id),
  source_name TEXT NOT NULL,
  target_date DATE   -- target completion
);

CREATE TABLE topics (
  topic_id    INTEGER PRIMARY KEY,
  source_id   INTEGER NOT NULL
    REFERENCES sources(source_id),
  topic_name  TEXT NOT NULL,
  pages       INTEGER,   -- book/PDF
  videos      INTEGER,   -- video course
  mocks       INTEGER DEFAULT 0,
  topic_order INTEGER    -- manual order
);
