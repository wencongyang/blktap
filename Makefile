obj-m := blktap.o
blktap-objs  := control.o ring.o device.o request.o sysfs.o

KDIR ?= /lib/modules/`uname -r`/build
EXTRA_CFLAGS += -I$M/include

default:
	$(MAKE) -C $(KDIR) M=$$PWD

install:
	$(MAKE) -C $(KDIR) M=$$PWD modules_install && /sbin/depmod -a

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean
