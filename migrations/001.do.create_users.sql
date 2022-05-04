CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  user_name TEXT NOT NULL,
  password TEXT NOT NULL,
  user_balance INTEGER DEFAULT 0,
  date_created TIMESTAMP DEFAULT NOW()
);
