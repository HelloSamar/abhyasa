-- Abhyasa: Practice. Prepare. Perform.
-- Exam > Subject > Source > Topic.  Safe to re-run.
PRAGMA foreign_keys = ON;  -- per connection; SQLite ignores REFERENCES without it

CREATE TABLE IF NOT EXISTS exams (
  exam_id       INTEGER PRIMARY KEY,
  exam_name     TEXT    NOT NULL,
  exam_date     TEXT    NOT NULL CHECK (date(exam_date) IS NOT NULL),  -- YYYY-MM-DD
  revision_days INTEGER NOT NULL DEFAULT 14 CHECK (revision_days >= 0)
);

CREATE TABLE IF NOT EXISTS subjects (
  subject_id   INTEGER PRIMARY KEY,
  exam_id      INTEGER NOT NULL REFERENCES exams(exam_id),
  subject_name TEXT    NOT NULL
);

CREATE TABLE IF NOT EXISTS sources (
  source_id    INTEGER PRIMARY KEY,
  subject_id   INTEGER NOT NULL REFERENCES subjects(subject_id),
  source_name  TEXT    NOT NULL,
  unit         TEXT    NOT NULL CHECK (unit IN ('page','video','mock','question')),
  min_per_unit INTEGER NOT NULL CHECK (min_per_unit > 0)  -- minutes per page, video, mock or question
);

CREATE TABLE IF NOT EXISTS topics (
  topic_id    INTEGER PRIMARY KEY,
  source_id   INTEGER NOT NULL REFERENCES sources(source_id),
  topic_name  TEXT    NOT NULL,
  units       INTEGER NOT NULL CHECK (units > 0),  -- size, in the source's unit
  topic_order INTEGER NOT NULL DEFAULT 0,
  weak        INTEGER NOT NULL DEFAULT 0 CHECK (weak IN (0,1))
);

CREATE INDEX IF NOT EXISTS ix_subjects_exam   ON subjects(exam_id);
CREATE INDEX IF NOT EXISTS ix_sources_subject ON sources(subject_id);
CREATE INDEX IF NOT EXISTS ix_topics_source   ON topics(source_id);
