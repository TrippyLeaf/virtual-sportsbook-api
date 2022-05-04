CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  league_id INTEGER NOT NULL,
  team_name STRING NOT NULL
);
