BASE_DIR = .
SRC_DIR = $(BASE_DIR)/src
TEST_DIR = $(BASE_DIR)/test
MISC_DIR = $(BASE_DIR)/misc

#CC = gcc
CFLAGS_DEPS = $(shell pkg-config --cflags libzmq libczmq jansson libsystemd)
CFLAGS = -c $(EXTRA_CFLAGS) -O2 -fno-omit-frame-pointer $(CFLAGS_DEPS)
LDFLAGS_DEPS = $(shell pkg-config --libs libzmq libczmq jansson libsystemd)
LDFLAGS = $(EXTRA_LDFLAGS) $(LDFLAGS_DEPS)

TARGETS = journal-gateway-zmtp-source journal-gateway-zmtp-sink journal-gateway-zmtp-control

default: $(TARGETS)

source: journal-gateway-zmtp-source
sink: journal-gateway-zmtp-sink
control: journal-gateway-zmtp-control
test: unit_test_sink

journal-gateway-zmtp-source: journal-gateway-zmtp-source.o
	$(CC) -o $@ $< $(LDFLAGS)

journal-gateway-zmtp-source.o: $(SRC_DIR)/journal-gateway-zmtp-source.c
	$(CC) $(CFLAGS) -o $@ $<

journal-gateway-zmtp-sink: journal-gateway-zmtp-sink.o
	$(CC) -o $@ $< $(LDFLAGS)

journal-gateway-zmtp-sink.o: $(SRC_DIR)/journal-gateway-zmtp-sink.c
	$(CC) $(CFLAGS) -o $@ $<

journal-gateway-zmtp-control: journal-gateway-zmtp-control.o
	$(CC) -o $@ $< $(LDFLAGS)

journal-gateway-zmtp-control.o:$(SRC_DIR)/journal-gateway-zmtp-control.c
	$(CC) $(CFLAGS) -o $@ $<

unit_test_sink: unit_test_sink.o
	$(CC) unit_test_sink.o $(LDFLAGS) $(SYSTEMD_LDFLAGS)  -o unit_test_sink

unit_test_sink.o:$(TEST_DIR)/unit_test_sink.c
	$(CC) $(CFLAGS) -I/test $(TEST_DIR)/unit_test_sink.c -o unit_test_sink.o



clean:
	rm -f *.o $(TARGETS)
