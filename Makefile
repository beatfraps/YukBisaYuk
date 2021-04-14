GCC=php
GCMD=artisan
GPATH=serve
GPORT=8088

run:
	$(GCC) $(GCMD) $(GPATH) --port $(GPORT)