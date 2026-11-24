-- Your data. Check the exam date in the official notice.
-- Minutes per unit are placeholders.
-- Chapter sizes = last page - first page + 1, from each book's contents page.
PRAGMA foreign_keys = ON;

INSERT INTO exams (exam_id, exam_name, exam_date, revision_days) VALUES
  (1, 'SSC CGL Mains', '2027-01-15', 5);

INSERT INTO subjects (subject_id, exam_id, subject_name) VALUES
  (1, 1, 'English'), (2, 1, 'Maths'), (3, 1, 'GS'), (4, 1, 'Computer'), (5, 1, 'Reasoning');

INSERT INTO sources (source_id, subject_id, source_name, unit, min_per_unit) VALUES
  (1, 1, 'Neetu Ma''am Class Notes 2026 (Bilingual)', 'page', 2),
  (2, 1, 'Blackbook English Vocabulary',              'page', 2),
  (3, 1, 'Pinnacle English (8th ed.)',                'page', 2),
  (4, 2, 'Pinnacle Maths (8th ed.)',                  'page', 5),
  (5, 3, 'Parmar Fatman',                             'page', 2),
  (6, 3, 'Pinnacle GS',                               'page', 2),
  (7, 4, 'Arihant Computer Awareness',                'page', 2),
  (8, 5, 'Reasoning Mocks',                           'mock', 90);

-- (source_id, topic_name, units, topic_order)
INSERT INTO topics (source_id, topic_name, units, topic_order) VALUES
  -- Neetu Ma'am Class Notes: pages 1-512
  (1,'Basic',6,1),(1,'Verb',52,2),(1,'Sentence & Types',5,3),(1,'Tense',31,4),
  (1,'Question Tag',11,5),(1,'Conditional Sentences',10,6),(1,'Subject Verb Agreement',27,7),
  (1,'Causative Verbs',4,8),(1,'Mood',3,9),(1,'Inversion',8,10),
  (1,'Infinitive & Gerund',12,11),(1,'Participle',7,12),(1,'Passive Voice',17,13),
  (1,'Narration',16,14),(1,'Noun',43,15),(1,'Pronoun',13,16),(1,'Adjective',26,17),
  (1,'Adverb',12,18),(1,'Confusing Adverbs & Adjectives',18,19),(1,'Article',9,20),
  (1,'Determiners',2,21),(1,'Preposition',20,22),(1,'Fixed Preposition and Exercise',54,23),
  (1,'Phrasal Verb',34,24),(1,'Conjunction',20,25),(1,'Parallelism',3,26),
  (1,'Modals',10,27),(1,'Superfluous Expression',4,28),(1,'Spellings',24,29),
  (1,'Proverb',3,30),(1,'Legal Terms',8,31),
  -- Other English books: whole book for now
  (2,'Whole book',572,1),
  (3,'Whole book',657,1),
  -- Maths, GS
  (4,'Whole book',672,1),
  (5,'Whole book',509,1),
  (6,'Whole book',556,1),
  -- Arihant Computer Awareness: chapters, pages 1-155
  (7,'Introduction to Computer',11,1),(7,'Computer Architecture',8,2),
  (7,'Computer Hardware',13,3),(7,'Computer Memory',12,4),(7,'Data Representation',10,5),
  (7,'Computer Software',8,6),(7,'Operating System',9,7),(7,'Programming Concepts',7,8),
  (7,'Microsoft Windows',11,9),(7,'Microsoft Office',23,10),(7,'Database Concepts',9,11),
  (7,'Data Communication and Networking',10,12),(7,'Internet and its Services',13,13),
  (7,'Computer Security',11,14),
  -- Your earlier seed said 191 pages; the contents page ends at 155.
  -- Delete this row if pages 156-191 are not part of what you will study.
  (7,'Pages after chapter 14 (156-191)',36,15),
  -- Reasoning
  (8,'Mock tests',45,1);
