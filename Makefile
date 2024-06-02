# **************************************************************************** #
# Common stuff
# **************************************************************************** #

CC = arm-none-eabi-gcc
CCLD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

BUILD_DIR = build
COMMON_DIR = common

COMMON_FLAGS = \
	-Wall \
	-mcpu=cortex-m0plus \
	-std=c17 \
	-nostartfiles \
	-Os

# **************************************************************************** #
# App stuff
# **************************************************************************** #

APP_BASENAME = app
APP_BASEDIR = $(APP_BASENAME)
APP_BUILD_DIR = $(APP_BASEDIR)/build
APP_OUTFILE_NAME = $(APP_BASENAME).elf
APP_OUTFILE_PATH = $(APP_BUILD_DIR)/$(APP_OUTFILE_NAME)

APP_CFLAGS = $(COMMON_FLAGS) \
	-ffunction-sections \
	-fdata-sections \

APP_LDFLAGS = -T linkerscripts/app.ld -r

APP_INC = -Icommon/cmsis/samd21a/include \
	-Icommon \

APP_VPATH = $(APP_BASEDIR)/main.c \

compile_app: $(APP_BUILD_DIR)
	$(CC) -o $(APP_OUTFILE_PATH) $(APP_LDFLAGS) $(APP_CFLAGS) $(APP_INC) app/main.c

hex_app:
	arm-none-eabi-objcopy -O ihex app/build/app.elf app/build/app.hex

clean_app:
	rm -f $(APP_OUTFILE_PATH) $(APP_BUILD_DIR)/$(APP_BASENAME).*