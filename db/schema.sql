create table customers (
  id integer not null,
  app_key varchar(20) not null,
  name varchar(255),
  email varchar(255),
  number integer,
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create unique index UNIQUE_customers on customers (app_key);

create table feedbacks (
  id integer not null,
  customer_id integer not null,
  staff_id integer not null,
  message text(2000000000) not null,
  status varchar(255) not null,
  feedback_id integer not null,
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create index INDEX_feedback_by_time on feedbacks (customer_id, created_at);

create table rails_admin_histories (
  id integer not null,
  message text(2000000000),
  username varchar(255),
  item integer,
  table varchar(255),
  month integer(2),
  year integer(5),
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create index index_rails_admin_histories on rails_admin_histories (item, table, month, year);

create table routes (
  id integer not null,
  name varchar(100) not null,
  primary key (id)
);

create table schedule_stops (
  id integer not null,
  schedule_id integer not null,
  stop_id integer not null,
  arrives_at time(2000000000) not null,
  departs_at time(2000000000) not null,
  delay integer not null,
  primary key (id)
);
create index INDEX_schedule_stops_by_arrival_time on schedule_stops (arrives_at);

create table schedules (
  id integer not null,
  departs_at time(2000000000) not null,
  arrives_at time(2000000000) not null,
  route_id integer not null,
  train_id integer not null,
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create index INDEX_schedules_by_route on schedules (route_id);

create table schema_migrations (
  version varchar(255) not null
);
create unique index unique_schema_migrations on schema_migrations (version);

create table sqlite_sequence (
  name varchar(2000000000),
  seq varchar(2000000000)
);

create table staffs (
  id integer not null,
  email varchar(255) not null,
  encrypted_password varchar(255) not null,
  reset_password_token varchar(255),
  reset_password_sent_at datetime(2000000000),
  remember_created_at datetime(2000000000),
  sign_in_count integer,
  current_sign_in_at datetime(2000000000),
  last_sign_in_at datetime(2000000000),
  current_sign_in_ip varchar(255),
  last_sign_in_ip varchar(255),
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create unique index index_staffs_on_reset_password_token on staffs (reset_password_token);
create unique index index_staffs_on_email on staffs (email);

create table stops (
  id integer not null,
  name varchar(255) not null,
  is_terminus boolean(2000000000) not null,
  primary key (id)
);

create table tickets (
  id integer not null,
  number varchar(255) not null,
  amount decimal(5,2) not null,
  status varchar(12) not null,
  schedule_id integer not null,
  customer_id integer not null,
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create unique index UNIQUE_tickets on tickets (number);

create table trains (
  id integer not null,
  number varchar(255) not null,
  cabins integer not null,
  seats integer not null,
  created_at datetime(2000000000) not null,
  updated_at datetime(2000000000) not null,
  primary key (id)
);
create unique index UNIQUE_trains on trains (number);

