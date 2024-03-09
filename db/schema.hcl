table "post" {
  schema = schema.public
  column "totallikes" {
    null = false
    type = integer
  }
  column "creator" {
    null = true
    type = bigint
  }
  column "id" {
    null = false
    type = bigserial
  }
  column "content" {
    null = true
    type = character_varying(255)
  }
  column "title" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
}
table "useraccount" {
  schema = schema.public
  column "birthdate" {
    null = true
    type = timestamp
  }
  column "id" {
    null = false
    type = bigserial
  }
  column "username" {
    null = true
    type = character_varying(255)
  }
  primary_key {
    columns = [column.id]
  }
  index "useraccount_username_key" {
    unique  = true
    columns = [column.username]
  }
}
schema "public" {
  comment = "standard public schema"
}
