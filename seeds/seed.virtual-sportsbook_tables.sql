BEGIN;

TRUNCATE
  accounts,
  leagues,
  matches,
  bets,
  teams,
  league_teams
RESTART IDENTITY CASCADE;

INSERT INTO accounts (email, user_balance)
VALUES
  ('test@email.com', 100)
;

INSERT INTO leagues (league_name, league)
VALUES
  ('NFL'),
  ('NCAAFB'),
  ('NBA'),
  ('NCAABB'),
  ('MLB'),
  ('NASCAR'),
  ('UFC'), 
  ('BOXING')
  ('PGA')
;

INSERT INTO teams (team_name, league_id)
VALUES
  ('Heat', 2),
  ('Celtics', 2),
  ('Bucks', 2),
  ('76ers', 2),
  ('Suns', 2),
  ('Grizzlies', 2),
  ('Warriors', 2),
  ('Mavs', 2)
  ;

INSERT INTO league_teams (league_id, team_id)
VALUES 
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (2, 6),
  (2, 7),
  (2, 8)
  ;

INSERT INTO matches (
    match_start,
    sport_id, 
    league_id, 
    home_team_id, 
    home_team_price, 
    away_team_id, 
    away_team_price
  )
VALUES 
('2022-05-02 07:00:00', 2, 2, 1, -8, 4, +8),
('2022-05-02 10:00:00', 2, 2, 5, -6, 8, +6)
;

INSERT INTO odds_pairs (fav, non_fav)
VALUES 
  (-8, +8),
  (-6, +6)

;

COMMIT;
