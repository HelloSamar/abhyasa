-- Category, source, topic, length, mocks,
-- topic number in category, target date

SELECT
  c.category_name AS category,
  s.source_name   AS source,
  t.topic_name    AS topic,
  t.pages,
  t.videos,
  t.mocks,
  ROW_NUMBER() OVER (
    PARTITION BY c.category_id
    ORDER BY s.source_id,
             t.topic_order,
             t.topic_id
  )               AS no,
  s.target_date   AS due
FROM topics t
JOIN sources s
  ON s.source_id = t.source_id
JOIN categories c
  ON c.category_id = s.category_id
ORDER BY c.category_name, no;
