-- yaml-cpp

project "yaml-cpp"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "On"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "%{prj.name}")

  IncludeDir["yaml-cpp"] = "%{wks.location}/libs/yaml-cpp/yaml-cpp/include"

  includedirs {
    "%{IncludeDir.yaml-cpp}",
    "yaml-cpp/src/"
  }

  files {
    "premake5.lua",

    "yaml-cpp/include/**.hpp",
    "yaml-cpp/src/contrib/*.cpp",
    "yaml-cpp/src/*.cpp",
  }

  filter "system:linux"
    pic "On"
  
  filter "system:macosx"
    pic "On"

  filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

  filter "configurations:Release"
    runtime "Release"
    optimize "On"
