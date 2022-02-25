function(vcpkg_download_func)
	if(NOT DEFINED GITHUB_HOME)
		set(GITHUB_HOME https://github.com)
	endif(NOT DEFINED GITHUB_HOME)
	set(VCPKG_HOME "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg")
	execute_process(COMMAND
		git clone ${GITHUB_HOME}/microsoft/vcpkg.git "${VCPKG_HOME}"
	)
	
	if(WIN32)
#		if(NOT EXISTS "${VCPKG_HOME}/vcpkg.exe")
#			message("bootstrap-vcpkg.bat running ......")
			execute_process(COMMAND
				cmd /c "${VCPKG_HOME}/bootstrap-vcpkg.bat"
			)
#		endif(NOT EXISTS "${VCPKG_HOME}/vcpkg.exe")
	else()
#		if(NOT EXISTS "${VCPKG_HOME}/vcpkg")
#			message("bootstrap-vcpkg.sh running ......")
			execute_process(COMMAND
				sh "$${VCPKG_HOME}/bootstrap-vcpkg.sh"
			)	
#		endif(NOT EXISTS "${VCPKG_HOME}/vcpkg")
	endif()
	set(ENV{PATH} "$ENV{PATH}${CMAKE_CURRENT_SOURCE_DIR}/vcpkg")
	set(VCPKG_ROOT
		"${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
		CACHE PATH "")
endfunction()

option(VCPKG_DOWNLOAD "download vcpkg")
if(VCPKG_DOWNLOAD)
	MESSAGE("ROOT")
	vcpkg_download_func()
endif(VCPKG_DOWNLOAD)
