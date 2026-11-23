-- Your data. Check the exam date in the
-- official notice. Minutes are placeholders.

INSERT INTO exams VALUES
  (1, 'SSC CGL Mains', '2027-01-15', 5);

INSERT INTO subjects VALUES
  (1, 1, 'English'),
  (2, 1, 'Maths'),
  (3, 1, 'GS'),
  (4, 1, 'Computer'),
  (5, 1, 'Reasoning');

INSERT INTO sources VALUES
  (1, 1, 'Neetu Mam Volume Book',        2),
  (2, 1, 'Blackbook English Vocabulary', 2),
  (3, 1, 'Pinnacle English (8th ed.)',   2),
  (4, 2, 'Pinnacle Maths (8th ed.)',     5),
  (5, 3, 'Parmar Fatman',                2),
  (6, 3, 'Pinnacle GS',                  2),
  (7, 4, 'Arihant Computer Awareness',   2),
  (8, 5, 'Reasoning Mocks',             90);

-- topic_id, source_id, name, pages, videos,
-- tests, mocks, order, weak
INSERT INTO topics VALUES
  (1, 1, 'Whole book', 478, NULL, NULL, 0, 1, 0),
  (2, 2, 'Whole book', 572, NULL, NULL, 0, 1, 0),
  (3, 3, 'Whole book', 657, NULL, NULL, 0, 1, 0),
  (4, 4, 'Whole book', 672, NULL, NULL, 0, 1, 0),
  (5, 5, 'Whole book', 509, NULL, NULL, 0, 1, 0),
  (6, 6, 'Whole book', 556, NULL, NULL, 0, 1, 0),
  (7, 7, 'Whole book', 191, NULL, NULL, 0, 1, 0),
  (8, 8, 'Mock tests', NULL, NULL,   45, 0, 1, 0);
