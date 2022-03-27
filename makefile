#trigger the two makefiles 

all: analysis data-prepartion

data-preparation:
	make -C src/data-preparation

analysis: data-preparation
	make -C src/analysis
	
clean:
    -rm -r data
    -rm -r gen
