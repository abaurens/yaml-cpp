-- example

project "example"
  kind "StaticLib"
  language "C++"
  cppdialect "C++17"
  staticruntime "On"
  systemversion "latest"

  targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
  objdir ("%{wks.location}/build/" .. outputdir .. "%{prj.name}")

  IncludeDir["example"] = "%{wks.location}/libs/example/include"

  includedirs {
    "%{IncludeDir.example}"
  }

  files {
    "premake5.lua",
    "include/example.hpp",
    "src/example.cpp",
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
