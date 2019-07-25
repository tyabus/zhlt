CXXFLAGS = -pthread -fpermissive -DHAVE_CONFIG_H -DSTDC_HEADERS -D_CONSOLE -DSYSTEM -DSYSTEM_POSIX -DHAVE_ASM_ATOMIC_H -DHAVE_ATOMIC -DHAVE_FCNTL_H -DHAVE_PTHREAD_H -DHAVE_STDDEF_H -DHAVE_SYS_ATOMIC_H -DHAVE_SYS_RESOURCE_H -DHAVE_SYS_STAT_H -DHAVE_SYS_TIME_H -DHAVE_UNISTD_E -DHAVE_UNISTD_H
INCLUDES = -Icommon -Itemplate
LDFLAGS = -Lcommon
BINDIR = bin

ARCH = $(shell uname -m)

ifeq ($(DEBUG), 1)
BUILDTYPE = debug
CXXFLAGS += -D_DEBUG -g -ggdb
else
BUILDTYPE = release
CXXFLAGS += -DNDEBUG -O1
endif

all: prepare_ hlcsg_ hlbsp_ hlvis_ hlrad_ ripent_

prepare_:
	mkdir -p $(BINDIR)

hlcsg_:
	$(CXX) $(INCLUDES) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/hlcsg-$(ARCH)-$(BUILDTYPE) -DHLCSG -DDOUBLEVEC_T common/blockmem.cpp common/bspfile.cpp common/cmdlib.cpp common/filelib.cpp common/files.cpp common/log.cpp common/mathlib.cpp common/messages.cpp common/resourcelock.cpp common/scriplib.cpp common/threads.cpp common/winding.cpp hlcsg/autowad.cpp hlcsg/brush.cpp hlcsg/brushunion.cpp hlcsg/hullfile.cpp hlcsg/map.cpp hlcsg/netvis_in_vis.cpp hlcsg/properties.cpp hlcsg/qcsg.cpp hlcsg/textures.cpp hlcsg/wadcfg.cpp hlcsg/wadinclude.cpp hlcsg/wadpath.cpp

hlbsp_:
	$(CXX) $(INCLUDES) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/hlbsp-$(ARCH)-$(BUILDTYPE) -DDOUBLEVEC_T common/blockmem.cpp common/bspfile.cpp common/cmdlib.cpp common/filelib.cpp common/files.cpp common/log.cpp common/mathlib.cpp common/messages.cpp common/resourcelock.cpp common/scriplib.cpp common/threads.cpp common/winding.cpp hlbsp/merge.cpp hlbsp/outside.cpp hlbsp/portals.cpp hlbsp/qbsp.cpp hlbsp/solidbsp.cpp hlbsp/surfaces.cpp hlbsp/tjunc.cpp hlbsp/writebsp.cpp

hlvis_:
	$(CXX) $(INCLUDES) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/hlvis-$(ARCH)-$(BUILDTYPE) -DDOUBLEVEC_T common/blockmem.cpp common/bspfile.cpp common/cmdlib.cpp common/filelib.cpp common/files.cpp common/log.cpp common/mathlib.cpp common/messages.cpp common/resourcelock.cpp common/scriplib.cpp common/threads.cpp common/winding.cpp hlvis/flow.cpp hlvis/vis.cpp hlvis/zones.cpp

hlrad_:
	$(CXX) $(INCLUDES) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/hlrad-$(ARCH)-$(BUILDTYPE) common/blockmem.cpp common/bspfile.cpp common/cmdlib.cpp common/filelib.cpp common/files.cpp common/log.cpp common/mathlib.cpp common/messages.cpp common/resourcelock.cpp common/scriplib.cpp common/threads.cpp common/winding.cpp hlrad/lerp.cpp hlrad/lightmap.cpp hlrad/mathutil.cpp hlrad/nomatrix.cpp hlrad/qrad.cpp hlrad/qradutil.cpp hlrad/sparse.cpp hlrad/trace.cpp hlrad/transfers.cpp hlrad/transparency.cpp hlrad/vismatrix.cpp hlrad/vismatrixutil.cpp

ripent_:
	$(CXX) $(INCLUDES) $(CXXFLAGS) $(LDFLAGS) -o $(BINDIR)/ripent-$(ARCH)-$(BUILDTYPE) ripent/ripent.cpp common/blockmem.cpp common/bspfile.cpp common/cmdlib.cpp common/filelib.cpp common/log.cpp common/messages.cpp common/scriplib.cpp common/mathlib.cpp

clean:
	rm -rf $(BINDIR)
