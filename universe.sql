
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  age_billions INT NOT NULL,
  amount_of_stars INT NOT NULL,
  galaxy_type TEXT,
  has_life BOOLEAN NOT NULL
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  age_billions INT,
  color TEXT,
  is_visible BOOLEAN,
  galaxy_id INT REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  average_temperature INT,
  planet_type TEXT,
  supports_life BOOLEAN,
  gravity_rating NUMERIC,
  star_id INT REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  diameter_km INT,
  surface_material TEXT,
  discovery_year INT,
  planet_id INT REFERENCES planet(planet_id)
);

CREATE TABLE satellite (
  satellite_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  is_operational BOOLEAN,
  planet_id INT REFERENCES planet(planet_id)
);


INSERT INTO galaxy (name, age_billions, amount_of_stars, galaxy_type, has_life)
VALUES
('Milky Way', 13, 200000, 'Spiral', FALSE),
('Milky Way2', 10, 300000, 'Spiral', FALSE),
('Milky Way3', 8, 150000, 'Spiral', FALSE),
('Milky Way4', 9, 180000, 'Spiral', FALSE),
('Milky Way5', 12, 120000, 'Elliptical', FALSE),
('Milky Way6', 11, 220000, 'Spiral', FALSE);

INSERT INTO star (name, age_billions, color, is_visible, galaxy_id)
VALUES
('Star1', 4, 'Yellow', TRUE, 1),
('Star2', 0, 'Blue', TRUE, 1),
('Star3', 10, 'Red', TRUE, 2),
('Star4', 8, 'Blue', TRUE, 2),
('Star5', 0, 'White', TRUE, 3),
('Star6', 4, 'Yellow-White', TRUE, 4);

INSERT INTO planet (name, average_temperature, planet_type, supports_life, gravity_rating, star_id)
VALUES
('Planet1', 167, 'Rocky', FALSE, 0.38, 1),
('Planet2', 464, 'Rocky', FALSE, 0.90, 1),
('Planet3', 15, 'Rocky', TRUE, 1.00, 1),
('Planet4', 60, 'Rocky', FALSE, 0.38, 1),
('Planet5', 110, 'Gas Giant', FALSE, 2.53, 2),
('Planet6', 140, 'Gas Giant', FALSE, 1.06, 2),
('Planet7', 195, 'Ice Giant', FALSE, 0.92, 3),
('Planet8', 200, 'Ice Giant', FALSE, 1.19, 3),
('Planet9', 22, 'Exoplanet', FALSE, 1.20, 4),
('Planet10', 30, 'Exoplanet', TRUE, 1.10, 5),
('Planet11', 10, 'Exoplanet', FALSE, 1.30, 6),
('Planet12', 1000, 'Gas Giant', FALSE, 1.50, 6);

INSERT INTO moon (name, diameter_km, surface_material, discovery_year, planet_id)
VALUES
('Moon1', 3474, 'Rock', 0, 3),
('Moon2', 22, 'Rock', 1877, 4),
('Moon3', 12, 'Rock', 1877, 4),
('Moon4', 3643, 'Volcanic', 1610, 5),
('Moon5', 3122, 'Ice', 1610, 5),
('Moon6', 5268, 'Ice', 1610, 5),
('Moon7', 4821, 'Ice', 1610, 5),
('Moon8', 5150, 'Ice', 1655, 6),
('Moon9', 504, 'Ice', 1789, 6),
('Moon10', 396, 'Ice', 1789, 6),
('Moon11', 1528, 'Ice', 1672, 6),
('Moon12', 1469, 'Ice', 1671, 6),
('Moon13', 1578, 'Ice', 1787, 7),
('Moon14', 1523, 'Ice', 1787, 7),
('Moon15', 1169, 'Ice', 1851, 7),
('Moon16', 1158, 'Ice', 1851, 7),
('Moon17', 2707, 'Ice', 1846, 8),
('Moon18', 340, 'Rock', 1949, 8),
('Moon19', 420, 'Rock', 1989, 8),
('Moon20', 194, 'Rock', 1989, 8);

INSERT INTO satellite (name, is_operational, planet_id)
VALUES
('Satellite1', TRUE, 3),
('Satellite2', TRUE, 3),
('Satellite3', TRUE, 5);
