

CPPFLAGS=-W -Wall -Wno-unused-variable -Wno-unused-parameter -Ofast
CFLAGS=-idirafter include

PROG_NAME=vol_oled
includes = $(wildcard *.h)

# make all
all: ${PROG_NAME}

# Make the library
OBJECTS=main.o timer.o status.o ArduiPi_OLED.o Adafruit_GFX.o \
	bcm2835.o display.o
LDLIBS=-lmpdclient -lcurl -ljsoncpp -lpthread
${OBJECTS}: ${includes}
${PROG_NAME}: ${OBJECTS}
	$(CXX) $(LDFLAGS) -o $@ $^ $(LDLIBS)

# clear build files
clean:
	rm -rf *.o ${PROG_NAME}


