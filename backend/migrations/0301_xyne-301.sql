-- XYNE-301: tighten users table before the new billing code
ALTER TABLE users DROP COLUMN legacy_flag;
ALTER TABLE users ALTER COLUMN email SET NOT NULL;
CREATE INDEX idx_users_email ON users (email);
UPDATE users SET plan = 'free' WHERE plan IS NULL;
