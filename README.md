# Abhyasa

**Practice. Prepare. Perform.**

A small study planner: a SQLite database holds the plan, and a one-page web app shows today's target per source and lets you log what you did.

## How it fits together

- `schema.sql` creates the tables (Exam > Subject > Source > Topic). Safe to re-run.
- `seed.sql` holds your plan. Each source has one unit (`page`, `video` or `mock`) and minutes per unit. Each topic has a size in that unit.
- `query.sql` lists every topic with its number within the subject and the date study ends.
- `export_data.py` writes `data.js` from the database. `index.html` reads `data.js`, so the plan lives in one place.
- Progress is **not** in the database. It is saved in your browser (`localStorage`).

## Build

```
rm -f abhyasa.db
sqlite3 abhyasa.db < schema.sql
sqlite3 abhyasa.db < seed.sql
sqlite3 -header -column abhyasa.db < query.sql   # optional report
python3 export_data.py                            # writes data.js
```

Commit `data.js` with `index.html`: GitHub Pages needs both.

## Daily page

`index.html` shows today's target per source and lets you log what you did.

- Study ends `revision_days` before the exam date. After that comes revision and mocks.
- Target for a source = units remaining at the start of today ÷ days left to study (today counts), rounded up. Your progress today does not change today's target.
- Overall progress is the average of each subject's progress, so one subject cannot hide another.
- Backup: "Show backup" prints your progress as text. Copy it into Notes now and then. "Restore from text" replaces everything saved in this browser.
- Phone: repo **Settings → Pages**, deploy from `main`, open the link in Safari.

## Edit the plan

Change `seed.sql`, rebuild (steps above), commit `data.js`. Topic ids can change when you rebuild from scratch, and saved progress is keyed by topic id. Keep ids stable by adding rows at the end, or take a backup first.
