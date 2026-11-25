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

`index.html` is a plain checklist of what to study next. It reads `data.js` (keep the two files together).

- Subject buttons at the top (All, English, Maths, GS, Computer, Reasoning) show one subject at a time, so you can focus on it.
- Each source lists its next two chapters in order (weak topics first). Sources with nothing left are hidden.
- Sources are ordered by progress: the ones furthest behind are at the top, "on track" ones lower, and ahead ones at the bottom. A source drops down the list as you finish chapters.
- Tap the circle to complete a chapter. It moves to "Completed" at the bottom and the next chapter appears. Tap again to undo.
- Tap a chapter's name to open −, +1 and +5 for partial progress.
- The percentage next to each source is how much of the whole source you have finished, followed by whether you are ahead, behind or on track. This compares your progress with an even pace from `study_start` (in `seed.sql`) to the end of study, measured against the plan through yesterday, with today's work included. The top line shows the same for all sources together.
- Open a chapter and tap **Mark weak** to flag it. Weak chapters move to the front of their source and the flag syncs between devices.
- Behind the scenes, the daily amount for a source = units left at the start of today ÷ days left to study (today counts), rounded up. Study ends `revision_days` before the exam date. This only decides which sources are due today.

## Sync between phone and computer

Progress is kept on each device, and can be synced through one private GitHub gist (a single small JSON file, no server).

1. Create a **classic** token at github.com/settings/tokens with only the **gist** scope.
2. On each device open the page, **Settings → Sync**, paste the token, tap **Connect**. The first device creates the gist; the others find it by itself.
3. After that, changes upload a couple of seconds after you tap, and the page checks for changes whenever you come back to it.

Notes: a "secret" gist is not private to anyone who has its link, but it only holds chapter counts. The token is stored on the device. Disconnect removes it. If you change something on two devices before either syncs, the larger count wins for each chapter.

## Backup and restore

Settings → Backup: "Show backup" prints your progress as text. Copy it into Notes now and then. "Restore" replaces what is saved on this device; anything that no longer matches the plan is ignored.

## Phone and offline

Repo **Settings → Pages**, deploy from `main`, open the link in Safari, then **Share → Add to Home Screen**. The page keeps a copy of itself, so it opens with no connection, and sync catches up when you are back online. Files needed: `index.html`, `data.js`, `manifest.webmanifest`, `sw.js` and the three `icon-*.png`.

## Edit the plan

Edit `seed.sql` on github.com. The workflow in `.github/workflows/build-data.yml` rebuilds `data.js` by itself within a minute. Create it once with **Add file → Create new file**, typing the full path `.github/workflows/build-data.yml`. Without it, rebuild by hand (steps above) and commit `data.js`. Saved progress is keyed by topic id. Keep ids stable by adding new topics at the end of `seed.sql`, or take a backup first.
