.SUFFIXES:

ifeq ($(strip $(PSL1GHT)),)
$(error PSL1GHT no esta definido)
endif

include $(PSL1GHT)/ppu_rules

TARGET  := ww_ps3
BUILD   := build
SOURCES := src src/recompiled

CXXFLAGS := -O2 -Wall -mcpu=cell \
            -D__PS3__ \
            -D__PSL1GHT__ \
            -I$(CURDIR)/src \
            -I$(CURDIR)/src/recompiled \
            -I$(CURDIR)/src/gcrecomp \
            $(LIBPSL1GHT_INC)

LDFLAGS := -mcpu=cell

LIBS := \
    -lrsx \
    -lgcm_sys \
    -lsysutil \
    -lsysmodule \
    -lio \
    -lrt \
    -lm \
    -llv2

CXXFILES := $(foreach dir,$(SOURCES),$(wildcard $(dir)/*.cpp))
OBJECTS  := $(patsubst %.cpp,$(BUILD)/%.o,$(CXXFILES))

all: $(TARGET).elf $(TARGET).self

$(TARGET).elf: $(OBJECTS)
	@echo Linking $@
	$(CXX) $(LDFLAGS) -o $@ $(OBJECTS) $(LIBS)

$(TARGET).self: $(TARGET).elf
	@echo Creating SELF
	make_self $< $@

npdrm: $(TARGET).elf
	@echo Creating NPDRM SELF
	make_fself_npdrm $< $(TARGET).self

pkg: $(TARGET).pkg

$(BUILD)/%.o: %.cpp
	@mkdir -p $(dir $@)
	@echo Compiling $<
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD)
	rm -f $(TARGET).elf $(TARGET).self $(TARGET).pkg

.PHONY: all clean npdrm pkg   