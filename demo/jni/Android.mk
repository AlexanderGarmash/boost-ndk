LOCAL_PATH:= $(call my-dir)
BOOST_LIB_PATH=../../boost/android/lib
BOOST_INCLUDE_PATH=$(LOCAL_PATH)/../../boost
#$(warning ########## LOCAL_PATH is $(LOCAL_PATH))

#########################################
# use prebuilt static library

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_system
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_system.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_filesystem
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_filesystem.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_thread
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_thread.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_iostreams
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_iostreams.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_regex
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_regex.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_math
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_math_c99.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_chrono
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_chrono.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_date
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_date_time.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_random
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_random.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)
include $(CLEAR_VARS)
LOCAL_MODULE:= boost_signals
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_signals.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_timer
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_timer.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_serialization
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_serialization.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_wserialization
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_wserialization.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE:= boost_exception
LOCAL_SRC_FILES:= $(BOOST_LIB_PATH)/libboost_exception.a
LOCAL_EXPORT_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(PREBUILT_STATIC_LIBRARY)

#########################################
### test use prebuilt static library

# test boost::iostreams
include $(CLEAR_VARS)
LOCAL_MODULE:= iostreams_test
LOCAL_SRC_FILES:= iostreams_test.cpp
LOCAL_STATIC_LIBRARIES := boost_iostreams
include $(BUILD_EXECUTABLE)

# test boost::date_time
include $(CLEAR_VARS)
LOCAL_MODULE:= time_test
LOCAL_SRC_FILES:= time_test.cpp
LOCAL_STATIC_LIBRARIES := boost_date
include $(BUILD_EXECUTABLE)

# test boost::filesystem
include $(CLEAR_VARS)
LOCAL_MODULE:= filesystem_test
LOCAL_SRC_FILES:= filesystem_test.cpp
LOCAL_STATIC_LIBRARIES := boost_system boost_filesystem
include $(BUILD_EXECUTABLE)

# test boost::regex
include $(CLEAR_VARS)
LOCAL_MODULE:= regex_test
LOCAL_SRC_FILES:= regex_test.cpp
LOCAL_STATIC_LIBRARIES := boost_regex
include $(BUILD_EXECUTABLE)

### test use local includes
# test boost smart ptr
include $(CLEAR_VARS)
LOCAL_MODULE:= smart_ptr_test
LOCAL_SRC_FILES:= smart_ptr_test.cpp
LOCAL_C_INCLUDES := $(BOOST_INCLUDE_PATH)
include $(BUILD_EXECUTABLE)

###test use jni with boost
include $(CLEAR_VARS)
LOCAL_MODULE:= BoostDemo
LOCAL_SRC_FILES:= BoostDemo.cpp
LOCAL_STATIC_LIBRARIES := boost_regex
include $(BUILD_SHARED_LIBRARY)