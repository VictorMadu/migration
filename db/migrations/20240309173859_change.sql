-- Modify "post" table
ALTER TABLE "post" ADD COLUMN "totallikes" integer NOT NULL;
-- Drop index "ukq6f8cqukfsvh0iswl1mc67i5a" from table: "useraccount"
DROP INDEX "ukq6f8cqukfsvh0iswl1mc67i5a";
-- Modify "useraccount" table
ALTER TABLE "useraccount" DROP COLUMN "firstname", DROP COLUMN "lastname", ADD COLUMN "birthdate" timestamp NULL;
-- Create index "useraccount_username_key" to table: "useraccount"
CREATE UNIQUE INDEX "useraccount_username_key" ON "useraccount" ("username");
