require "premake/library"

applications = {}

function application(name)
	group("Applications")
	project(name)
		filter {"configurations:Debug"}
			kind("ConsoleApp")
		filter {"configurations:Release"}
			kind("WindowedApp")
		filter {}
		location("build")
		targetdir("bin/%{prj.name}/%{cfg.longname}_%{cfg.architecture}")
		files({
			"include/%{prj.name}/**.h",
			"src/%{prj.name}/**.cpp",
			"src/%{prj.name}/**.c",
		})
		includedirs("include")
		
		links(libraries)
	
	table.insert(applications, name)
end