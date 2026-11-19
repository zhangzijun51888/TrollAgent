ARCHS = arm64 arm64e
TARGET = iphone:clang:16.5:15.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HelloWorld
HelloWorld_LDFLAGS = -fuse-ld=lld
HelloWorld_FILES = Tweak.x
HelloWorld_CFLAGS = -fobjc-arc -Wno-error -Wno-deprecated-declarations -Wno-unused-variable
HelloWorld_FRAMEWORKS = Foundation UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
