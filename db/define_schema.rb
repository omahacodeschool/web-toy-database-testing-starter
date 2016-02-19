require_relative "./_configure"

DB.define_table("directors")
DB.define_column("directors", "name", "string")

DB.define_table("movies")
DB.define_column("movies", "title", "string")
DB.define_column("movies", "director_id", "integer")

DB.define_table("actors")
DB.define_column("actors", "name", "string")

DB.define_table("performances")
DB.define_column("performances", "actor_id", "integer")
DB.define_column("performances", "movie_id", "integer")