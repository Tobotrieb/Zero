
libraries = {}

function library(name, link_against)
	group("Libraries")
	project(name)
		kind("StaticLib")
		location("build")
		targetdir("lib")
		files({
			"include/%{prj.name}/**.h",
			"src/%{prj.name}/**.cpp",
			"src/%{prj.name}/**.c",
		})
		includedirs("include")
		
		links(link_against)
		filter {"system:windows"}
			links("OpenGL32")
		
		filter {"system:not windows"}
			links("GL")
		filter{}
	
	table.insert(libraries, name)
end