GCC=php
GCMD=artisan
GPATH=serve
GPORT=8080

run:
	$(GCC) $(GCMD) $(GPATH) --port $(GPORT)