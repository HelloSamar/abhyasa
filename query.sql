-- SQLite 3.25+ (window functions). Study ends before the revision window.
SELECT
  e.exam_name    AS exam,
  sj.subject_name AS subject,
  s.source_name  AS source,
  t.topic_name   AS topic,
  s.unit         AS unit,
  t.units        AS units,
  ROW_NUMBER() OVER (
    PARTITION BY sj.subject_id
    ORDER BY s.source_id, t.topic_order, t.topic_id
  ) AS no,
  t.weak,
  date(e.exam_date, '-' || e.revision_days || ' days') AS study_end
FROM topics t
JOIN sources  s  ON s.source_id   = t.source_id
JOIN subjects sj ON sj.subject_id = s.subject_id
JOIN exams    e  ON e.exam_id     = sj.exam_id
ORDER BY sj.subject_id, no;
