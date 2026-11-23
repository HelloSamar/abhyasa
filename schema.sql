-- Abhyasa: Practice. Prepare. Perform.
-- Exam > Subject > Source > Topic

CREATE TABLE exams (
  exam_id       INTEGER PRIMARY KEY,
  exam_name     TEXT NOT NULL,
  exam_date     DATE NOT NULL,
  revision_days INTEGER DEFAULT 14
);

CREATE TABLE subjects (
  subject_id   INTEGER PRIMARY KEY,
  exam_id      INTEGER NOT NULL
    REFERENCES exams(exam_id),
  subject_name TEXT NOT NULL
);

CREATE TABLE sources (
  source_id    INTEGER PRIMARY KEY,
  subject_id   INTEGER NOT NULL
    REFERENCES subjects(subject_id),
  source_name  TEXT NOT NULL,
  min_per_unit INTEGER  -- minutes/page|video
);

CREATE TABLE topics (
  topic_id    INTEGER PRIMARY KEY,
  source_id   INTEGER NOT NULL
    REFERENCES sources(source_id),
  topic_name  TEXT NOT NULL,
  pages       INTEGER,
  videos      INTEGER,
  tests       INTEGER,  -- mock-test series
  mocks       INTEGER DEFAULT 0,
  topic_order INTEGER,
  weak        INTEGER DEFAULT 0
);
