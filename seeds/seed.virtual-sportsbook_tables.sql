BEGIN;

TRUNCATE
  users,
  leagues,
  matches,
  odds,
RESTART IDENTITY CASCADE;

INSERT INTO users (full_name, email, password, user_name, user_balance)
VALUES
  ('Test_First Test_Last', 'test@email.com', 'test', 'tester', 1000)
;

INSERT INTO leagues (league_name, league_id)
VALUES
  ('NFL', 1),
  ('NCAAFB', 2),
  ('NBA', 3),
  ('NCAABB', 4),
  ('MLB', 5),
  ('UFC', 6),
  ('PGA', 7), 
  ('NHL', 8),

;

INSERT INTO matches (
    league_id,
    match_id,
    match_start,
    home_team,
    bet_id,
    away_team,
    bet_id
  )
VALUES 
(3, 1, '2022-05-02 7:00:00', 'Heat', 1, '76ers', 2),
(3, 2, '2022-05-02 10:00:00', 'Suns', 3, 'Mavs', 4)
;

INSERT INTO odds (bet_id, spread, moneyline, total)
VALUES 
  (1, -8 -110, -350, 208.5),
  (2, +8 -110, +280, 208.5),
  (3, -6 -110, -235, 214.5),
  (4, +6, -110, +190, 214.5)
 ;

COMMIT;
