BEGIN;

TRUNCATE
  Users,
  Leagues,
  Matches,
  Odds

RESTART IDENTITY CASCADE;

INSERT INTO Users (user_name, full_name, email, password, user_balance)
VALUES
  ('TestAccount', 'Test_First Test_Last', 'test@email.com', 'test', 100)
;

INSERT INTO Leagues (league_name, league_id)
VALUES
  ('NFL', 1),
  ('NCAAFB', 2),
  ('NBA', 3),
  ('NCAABB', 4),
  ('MLB', 5),
  ('UFC/BOXING', 6),
  ('PGA', 7)
  ;

INSERT INTO Matches (
    match_start,
    league_id,
    match_id,
    team_name,
    team_name
    
    
  )
VALUES 
('2022-05-02 07:00:00', 3, 1, 'Heat', '76ers'),
('2022-05-02 10:00:00', 3, 1, 'Suns', 'Mavs'),
;

INSERT INTO Odds (team_name, spread, moneyline, total)
VALUES 
  ('Heat', -8 1/2, -350, 208 1/2),
  ('76ers', +8 1/2, +280, 208 1/2),
  ('Suns', -5 1/2, -235, 214 1/2),
  ('Mavs', +5 1/2, +190, 214 1/2)
;

COMMIT;
