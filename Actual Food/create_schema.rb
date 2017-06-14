# The Database Schema
#
# Just to take a relevant example, let’s say we’re designing the schema (that is, the table structure) of a relational database to store product data for packaged food goods — the kind you find in the inner aisles of the supermarket.
#
# Because we’re cool, let’s assume we’re using PostgreSQL.
#
# Your job here is to decide on the table structure, and to write the SQL commands to make the tables and any constraints. Please do this without assuming the use of any active record implementation — just write plain SQL.
#
# There is no one right answer here — just use your background knowledge about packaged food products and your sense of good database design, and imagine the various use cases and stakeholders of an online food store that isn’t horrible.


## Goods: id: integer, name: string, price: string, brand_id: integer
## Brands: id: integer, name: string

CREATE TABLE goods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price VARCHAR(255) NOT NULL,
    brand_id INTEGER NOT NULL
);
CREATE TABLE brands (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

# I can't remember how to write sql commands in Ruby (or any language) without activerecord.
# Price was chosen to be a string for cases such as chicken => $4.50 / lb
