GCC	= g++
NANAPATH = .
OBJ = $(patsubst src/%.cc, obj/%.o, $(wildcard src/*.cc))
OBX = $(patsubst src/%.cpp, obj/%.x, $(wildcard src/*.cpp))
BIN	= $(patsubst obj/%.x, %.x, $(OBX))

NANAINC	= $(NANAPATH)/include
NANALIB = $(NANAPATH)/build/bin

INCS	= -I$(NANAINC)
LIBS	= -L$(NANALIB) -lnana -lX11 -lpthread -lrt -lXft -lpng -lasound -lfontconfig -lstdc++fs


all : $(BIN)

obj/%.o : src/%.cc
	$(GCC) -g -c $< -o $@ $(INCS) -std=c++0x

obj/%.x : src/%.cpp
	$(GCC) -g -c $< -o $@ $(INCS) -std=c++0x

%.x : obj/%.x $(OBJ)
	$(GCC) $< $(OBJ) $(LIBS) -o $@ 

clean:
	rm obj/*.? *.x
