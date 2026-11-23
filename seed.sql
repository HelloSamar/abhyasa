-- Sample data (replace with your own)

INSERT INTO categories VALUES
  (1, 'Maths'),
  (2, 'English');

INSERT INTO sources VALUES
  (1, 1, 'Quant Book',   '2026-12-31'),
  (2, 1, 'Maths Videos', '2027-01-15'),
  (3, 2, 'Grammar PDF',  '2026-12-20');

INSERT INTO topics VALUES
  (1, 1, 'Percentages', 40, NULL, 2, 1),
  (2, 1, 'Ratio',       35, NULL, 1, 2),
  (3, 2, 'Algebra',     NULL, 25, 3, 1),
  (4, 3, 'Tenses',      30, NULL, 2, 1),
  (5, 3, 'Articles',    18, NULL, 1, 2);
