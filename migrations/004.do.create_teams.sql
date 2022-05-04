CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  league_id INTEGER NOT NULL,
  team_name TEXT NOT NULL UNIQUE,
  FOREIGN KEY (league_id) REFERENCES leagues (league_id)
);
