-- scaffold geniefile for xxHash

xxHash_script = path.getabsolute(path.getdirectory(_SCRIPT))
xxHash_root = path.join(xxHash_script, "xxHash")

xxHash_includedirs = {
	path.join(xxHash_script, "config"),
	xxHash_root,
}

xxHash_libdirs = {}
xxHash_links = {}
xxHash_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { xxHash_includedirs }
	end,

	_add_defines = function()
		defines { xxHash_defines }
	end,

	_add_libdirs = function()
		libdirs { xxHash_libdirs }
	end,

	_add_external_links = function()
		links { xxHash_links }
	end,

	_add_self_links = function()
		links { "xxHash" }
	end,

	_create_projects = function()

project "xxHash"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		xxHash_includedirs,
	}

	defines {}

	files {
		path.join(xxHash_script, "config", "**.h"),
		path.join(xxHash_root, "**.h"),
		path.join(xxHash_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
