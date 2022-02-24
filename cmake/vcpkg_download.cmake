function(vcpkg_dowload_func)
	if(NOT DEFINED GITHUB_HOME)
		set(GITHUB_HOME https://github.com)
	endif()
	execute_process(COMMAND
		git clone ${GITHUB_HOME}/microsoft/vcpkg.git "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg"
	)

	if(WIN32)
		message("running vcpkg/bootstrap-vcpkg.bat")
		execute_process(COMMAND
			cmd /c "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/bootstrap-vcpkg.bat"
		)
	else()
		message("running vcpkg/bootstrap-vcpkg.sh")
		execute_process(COMMAND
			sh "${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/bootstrap-vcpkg.sh"
		)
	endif()

	set(ENV{PATH} "$ENV{PATH}${CMAKE_CURRENT_SOURCE_DIR}/vcpkg")
	set(VCPKG_ROOT
		"${CMAKE_CURRENT_SOURCE_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake"
		CACHE PATH "")
endfunction()

option(vcpkg_dowload "download vcpkg")
if(vcpkg_dowload)
	vcpkg_dowload_func()
endif()