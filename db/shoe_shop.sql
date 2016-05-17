DROP TABLE shoe_orders;
CREATE TABLE shoe_orders (
  id serial4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  shoe_type VARCHAR(255),
  quantity INT4,
  size INT4
)