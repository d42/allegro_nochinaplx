
all: directories opera gs chrome

directores:
	mkdir -p {opera, gs, chrome}

opera: compile
	cat opera_header > opera/includes/replace.js
	cat replace.js >> opera/includes/replace.js
	make -C opera all

gs: compile
	cat gs_header > gs/replace.js
	cat replace.js >> gs/replace.user.js
chrome: compile
	cat replace.js > chrome/replace.js


compile:
	coffee -b -c replace.coffee
