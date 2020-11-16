
function external_library(name)
	group("ExternalLibraries")
	project(name)
		kind("StaticLib")
		location("build")
		targetdir("lib")
		includedirs("include")
		include("include/" .. name .. ".lua")
end