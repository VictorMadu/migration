-- Create "post" table
CREATE TABLE "post" (
  "id" bigserial NOT NULL,
  "content" character varying(255) NULL,
  "creator" bigint NULL,
  "title" character varying(255) NULL,
  PRIMARY KEY ("id")
);
-- Create "useraccount" table
CREATE TABLE "useraccount" (
  "id" bigserial NOT NULL,
  "firstname" character varying(255) NULL,
  "lastname" character varying(255) NULL,
  "username" character varying(255) NULL,
  PRIMARY KEY ("id")
);
-- Create index "ukq6f8cqukfsvh0iswl1mc67i5a" to table: "useraccount"
CREATE UNIQUE INDEX "ukq6f8cqukfsvh0iswl1mc67i5a" ON "useraccount" ("username");
