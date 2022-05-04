CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE matches (
  match_id uuid PRIMARY KEY DEFAULT uuid_generate_v4(),
  match_start TIMESTAMP,
  league_id INTEGER NOT NULL,
  FOREIGN KEY (league_id) REFERENCES leagues (league_id),
  home_team_id INTEGER NOT NULL,
  FOREIGN KEY (home_team_id) REFERENCES teams (team_id),
  home_team_spread REAL NOT NULL,
  home_team_moneyline REAL NOT NULL,
  away_team_id INTEGER NOT NULL,
  FOREIGN KEY (away_team_id)  REFERENCES teams (team_id),
  away_team_spread REAL NOT NULL,
  away_team_moneyline REAL NOT NULL,
  total_over INTEGER NOT NULL,
  total_under INTEGER NOT NULL,
  match_winner INTEGER DEFAULT NULL,
  FOREIGN KEY (match_winner) REFERENCES teams (team_id)
);

