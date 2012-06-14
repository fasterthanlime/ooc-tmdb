
all:
	rock -v
	(cd snowflake && make)
	cp snowflake/tmdb_test .

clean:
	rm -f snowflake tmdb_test

