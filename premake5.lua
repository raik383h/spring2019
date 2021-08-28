outputdir = "%{cfg.buildcfg}/%{cfg.system}-%{cfg.architecture}"

includeDir = {}

libDir = {}

projectName = "Project"

workspace "SimpleEmailLab1" -- ChangeProject
	location "workspace"
	architecture "x86_64"

	startproject "Lab1" -- Change this to what's ever the starting project is 

	configurations{
		"Debug",
		"Dist",
		"Release"
	}

	targetdir ("bin/" .. outputdir)
	objdir ("bin-int/" .. outputdir)

	filter "system:windows"
		defines "_WINDOWS"
	filter "system:linux"
		defines "_LINUX"
	filter "system:macosx"
		defines "_OSX"
		
    filter "configurations:Debug"
        defines "_DEBUG"
        symbols "On"
        runtime "Debug"
    filter "configurations:Dist"
        defines "_DIST"
        optimize "On"
        runtime "Release"
    filter "configurations:Release"
        defines "_RELEASE"
        optimize "On"
        runtime "Release"

project "Lab1" -- Default Project
	language "C#"
	kind "ConsoleApp" -- ConsoleApp / SharedLib
	-- defines "_DLL" -- If SharedLib

	dotnetframework "5.0.400"
	toolset "dotnet"

	files{
		"SimpleEmailLab1/**.cs"
	}

	links{
		"System"
	}

