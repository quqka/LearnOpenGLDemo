function(std_image_download_func)
	if(NOT DEFINED GITHUB_RAW)
		set(GITHUB_RAW "https://raw.githubusercontent.com")
	endif()
	if (NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image.h")
		message("std_image.h downloading ......")
		file(DOWNLOAD
			"${GITHUB_RAW}/nothings/stb/master/stb_image.h"
			"${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image.h"
		)
	endif(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/include/stb_image.h")
endfunction()

option(STD_IMAGE_DOWNLOAD "download std_image" ON)
if(STD_IMAGE_DOWNLOAD)
	std_image_download_func()
endif()
