QT -= core
QT -= gui

TARGET = simQHull
TEMPLATE = lib

DEFINES -= UNICODE
DEFINES += QT_COMPIL
DEFINES += SIM_MATH_DOUBLE # math and vector classes
CONFIG += shared plugin
INCLUDEPATH += "../include"
INCLUDEPATH += "qHull"

*-msvc* {
    QMAKE_CXXFLAGS += -O2
    QMAKE_CXXFLAGS += -W3
}
*-g++* {
    QMAKE_CXXFLAGS += -O3
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS += -fvisibility=hidden
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
    ../include/simLib/scriptFunctionData.cpp \
    ../include/simLib/scriptFunctionDataItem.cpp \
    ../include/simLib/simLib.cpp \
    sourceCode/simQHull.cpp \
    ../include/simMath/mathFuncs.cpp \
    ../include/simMath/3Vector.cpp \
    ../include/simMath/4Vector.cpp \
    ../include/simMath/7Vector.cpp \
    ../include/simMath/3X3Matrix.cpp \
    ../include/simMath/4X4Matrix.cpp \
    ../include/simMath/mXnMatrix.cpp \
    external/qHull/userprintf_rbox.c \
    external/qHull/userprintf.c \
    external/qHull/usermem.c \
    external/qHull/user.c \
    external/qHull/stat.c \
    external/qHull/rboxlib.c \
    external/qHull/random.c \
    external/qHull/qset.c \
    external/qHull/poly2.c \
    external/qHull/poly.c \
    external/qHull/merge.c \
    external/qHull/mem.c \
    external/qHull/libqhull.c \
    external/qHull/io.c \
    external/qHull/global.c \
    external/qHull/geom2.c \
    external/qHull/geom.c \

HEADERS +=\
    ../include/simLib/scriptFunctionData.h \
    ../include/simLib/scriptFunctionDataItem.h \
    ../include/simLib/simLib.h \
    sourceCode/simQHull.h \
    ../include/simMath/mathFuncs.h \
    ../include/simMath/mathDefines.h \
    ../include/simMath/3Vector.h \
    ../include/simMath/4Vector.h \
    ../include/simMath/7Vector.h \
    ../include/simMath/3X3Matrix.h \
    ../include/simMath/4X4Matrix.h \
    ../include/simMath/mXnMatrix.h \
    external/qHull/user.h \
    external/qHull/stat.h \
    external/qHull/random.h \
    external/qHull/qset.h \
    external/qHull/qhull_a.h \
    external/qHull/poly.h \
    external/qHull/merge.h \
    external/qHull/mem.h \
    external/qHull/libqhull.h \
    external/qHull/io.h \
    external/qHull/geom.h \

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
