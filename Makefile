NPM     	=   npm
BUILD   	=   ./build/
RELEASE 	=   ./releases/
GULP    	=   ./node_modules/.bin/gulp
BOWER   	=   ./node_modules/.bin/bower
NWBUILD 	=   node ./node_modules/.bin/nwbuild
PLATFORM	?=  win64
NWVER		?=  0.12.1

all: install build

install:
		$(NPM) install
		$(BOWER) install

build:
		$(GULP)

run:
		$(NWBUILD) -v $(NWVER) -r $(BUILD)

watch:
		$(GULP) watch -d

release:
		$(GULP) release -p $(PLATFORM)

clean:
		rm -rf ./bower_components
		rm -rf ./build
		rm -rf ./node_modules

fclean: clean
		rm -rf $(BUILD)

.PHONY: all install build run watch release clean fclean
