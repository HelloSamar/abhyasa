# Abhyasa

**Practice. Prepare. Perform.**

A small study-tracker database.

## What it shows

For every topic:

1. Category
2. Source name
3. Topic name
4. Length (pages or videos) and mock tests
5. Topic number within its category
6. Source target completion date

## Files

- `schema.sql` creates the tables
- `seed.sql` adds sample data
- `query.sql` runs the report

## Run it

```
sqlite3 abhyasa.db < schema.sql
sqlite3 abhyasa.db < seed.sql
sqlite3 -header -column abhyasa.db < query.sql
```

## Sample output

| category | source | topic | pages | videos | mocks | no | due |
|---|---|---|---|---|---|---|---|
| English | Grammar PDF | Tenses | 30 |  | 2 | 1 | 2026-12-20 |
| English | Grammar PDF | Articles | 18 |  | 1 | 2 | 2026-12-20 |
| Maths | Quant Book | Percentages | 40 |  | 2 | 1 | 2026-12-31 |
| Maths | Quant Book | Ratio | 35 |  | 1 | 2 | 2026-12-31 |
| Maths | Maths Videos | Algebra |  | 25 | 3 | 3 | 2027-01-15 |

## Notes

- `no` restarts at 1 in each category.
- `pages` or `videos` is empty, depending on the source type.
- Target date is stored per source.
