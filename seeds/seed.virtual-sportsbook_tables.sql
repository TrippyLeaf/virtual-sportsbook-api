BEGIN;

TRUNCATE
  users,
  sports,
  leagues,
  matches,
  bets,
  teams,
  league_teams
RESTART IDENTITY CASCADE;

INSERT INTO users (user_name, email, password, user_balance)
VALUES
  ('TestAccount', 'test@email.com', 'test', 100)
;

INSERT INTO sports (sport_name)
VALUES
  ('American Football'),
  ('Basketball'),
  ('Baseball'),
  ('Boxing/MMA'),
  ('Golf')
;

INSERT INTO leagues (league_name, sport_id)
VALUES
  ('NFL', 1),
  ('NCAA -FB', 1),
  ('NBA', 2),
  ('NCAA - BB', 2),
  ('MLB', 3),
  ('UFC', 4),
  ('PGA', 5), 
  ('LPGA', 5)
;

INSERT INTO teams (team_name, team_ranking)
VALUES
  ('Heat', 1),
  ('Celtics', 2),
  ('Bucks', 3),
  ('76ers', 4),
  ('Suns', 5),
  ('Grizzlies', 6),
  ('Warriors', 7),
  ('Mavs', 8)
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
