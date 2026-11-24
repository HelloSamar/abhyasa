# Abhyasa

**Practice. Prepare. Perform.**

A small study planner: a SQLite database holds the plan, and a one-page web app shows today's target per source and lets you log what you did.

## How it fits together

- `schema.sql` creates the tables (Exam > Subject > Source > Topic). Safe to re-run.
- `seed.sql` holds your plan. Each source has one unit (`page`, `video`, `mock` or `question`) and minutes per unit. Each topic has a size in that unit.
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

`index.html` is a checklist of what to study next. It reads `data.js` (keep the two files together).

- Each source is a glass panel listing its next two chapters in order (weak topics first). Sources with nothing left are hidden.
- Tap the circle to complete a chapter. It moves to the "Completed" line at the bottom and the next chapter appears. Tap the circle again to undo.
- Tap a chapter's name to open −, +1 and +5 for partial progress.
- Each source label shows the percentage of the whole source you have finished.
- Behind the scenes, the daily amount for a source = units left at the start of today ÷ days left to study (today counts), rounded up. Study ends `revision_days` before the exam date. This only decides which sources are due today.
- Backup (collapsed at the bottom): "Show backup" prints your progress as text. Copy it into Notes now and then. "Restore" replaces what is saved in this browser; anything that no longer matches the plan is ignored.
- Phone: repo **Settings → Pages**, deploy from `main`, open the link in Safari.

## Edit the plan

Change `seed.sql`, rebuild (steps above), commit `data.js`. Saved progress is keyed by topic id. Keep ids stable by adding new topics at the end of `seed.sql`, or take a backup first.
