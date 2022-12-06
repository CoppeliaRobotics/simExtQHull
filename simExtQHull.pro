QT -= core
QT -= gui

TARGET = simExtQHull
TEMPLATE = lib

DEFINES -= UNICODE
DEFINES += QT_COMPIL
DEFINES += SIM_MATH_DOUBLE # math and vector classes
CONFIG += shared plugin
INCLUDEPATH += "../include"
INCLUDEPATH += "../simMath"
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
    DEFINES += WIN_SIM
}

macx {
    INCLUDEPATH += "/usr/local/include"
    DEFINES += MAC_SIM
}

unix:!macx {
    DEFINES += LIN_SIM
}

SOURCES += \
    ../common/scriptFunctionData.cpp \
    ../common/scriptFunctionDataItem.cpp \
    ../common/simLib.cpp \
    simExtQHull.cpp \
    ../simMath/MyMath.cpp \
    ../simMath/3Vector.cpp \
    ../simMath/4Vector.cpp \
    ../simMath/7Vector.cpp \
    ../simMath/3X3Matrix.cpp \
    ../simMath/4X4Matrix.cpp \
    ../simMath/MMatrix.cpp \
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
    ../include/simLib.h \
    simExtQHull.h \
    ../simMath/MyMath.h \
    ../simMath/mathDefines.h \
    ../simMath/3Vector.h \
    ../simMath/4Vector.h \
    ../simMath/7Vector.h \
    ../simMath/3X3Matrix.h \
    ../simMath/4X4Matrix.h \
    ../simMath/MMatrix.h \
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
