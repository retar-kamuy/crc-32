CC	 = /usr/bin/clang
CXX	 = /usr/bin/clang++

BUILD_DIR	 = build

TARGET		 = crc32

CMAKEFLAGS	 = -B$(BUILD_DIR) -G Ninja

all: build run

build: $(BUILD_DIR)/$(TARGET)
$(BUILD_DIR)/$(TARGET):
	cmake $(CMAKEFLAGS) . \
	&& cd $(BUILD_DIR) \
	&& ninja

run: $(BUILD_DIR)/$(TARGET)
	./$(BUILD_DIR)/$(TARGET)

clean:
	rm -rf $(BUILD_DIR)
