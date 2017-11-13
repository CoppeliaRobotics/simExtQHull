QT -= core
QT -= gui

TARGET = v_repExtQhull
TEMPLATE = lib

DEFINES -= UNICODE
DEFINES += QT_COMPIL
CONFIG += shared
INCLUDEPATH += "../include"
INCLUDEPATH += "../v_repMath"
INCLUDEPATH += "qHull"

*-msvc* {
    QMAKE_CXXFLAGS += -O2
    QMAKE_CXXFLAGS += -W3
}
*-g++* {
    QMAKE_CXXFLAGS += -O3
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS += -Wno-unused-parameter
    QMAKE_CXXFLAGS += -Wno-strict-aliasing
    QMAKE_CXXFLAGS += -Wno-empty-body
    QMAKE_CXXFLAGS += -Wno-write-strings

    QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
    QMAKE_CXXFLAGS += -Wno-unused-local-typedefs
    QMAKE_CXXFLAGS += -Wno-narrowing

    QMAKE_CFLAGS += -O3
    QMAKE_CFLAGS += -Wall
    QMAKE_CFLAGS += -Wno-strict-aliasing
    QMAKE_CFLAGS += -Wno-unused-parameter
    QMAKE_CFLAGS += -Wno-unused-but-set-variable
    QMAKE_CFLAGS += -Wno-unused-local-typedefs
}

win32 {
    DEFINES += WIN_VREP
}

macx {
    INCLUDEPATH += "/usr/local/include"
    DEFINES += MAC_VREP
}

unix:!macx {
    DEFINES += LIN_VREP
}

SOURCES += \
    ../common/scriptFunctionData.cpp \
    ../common/scriptFunctionDataItem.cpp \
    ../common/v_repLib.cpp \
    v_repExtQhull.cpp \
    ../v_repMath/MyMath.cpp \
    ../v_repMath/3Vector.cpp \
    ../v_repMath/4Vector.cpp \
    ../v_repMath/7Vector.cpp \
    ../v_repMath/3X3Matrix.cpp \
    ../v_repMath/4X4Matrix.cpp \
    qHull/userprintf_rbox.c \
    qHull/userprintf.c \
    qHull/usermem.c \
    qHull/user.c \
    qHull/stat.c \
    qHull/rboxlib.c \
    qHull/random.c \
    qHull/qset.c \
    qHull/poly2.c \
    qHull/poly.c \
    qHull/merge.c \
    qHull/mem.c \
    qHull/libqhull.c \
    qHull/io.c \
    qHull/global.c \
    qHull/geom2.c \
    qHull/geom.c \

HEADERS +=\
    ../include/scriptFunctionData.h \
    ../include/scriptFunctionDataItem.h \
    ../include/v_repLib.h \
    v_repExtQhull.h \
    ../v_repMath/MyMath.h \
    ../v_repMath/mathDefines.h \
    ../v_repMath/3Vector.h \
    ../v_repMath/4Vector.h \
    ../v_repMath/7Vector.h \
    ../v_repMath/3X3Matrix.h \
    ../v_repMath/4X4Matrix.h \
    qHull/user.h \
    qHull/stat.h \
    qHull/random.h \
    qHull/qset.h \
    qHull/qhull_a.h \
    qHull/poly.h \
    qHull/merge.h \
    qHull/mem.h \
    qHull/libqhull.h \
    qHull/io.h \
    qHull/geom.h \

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
