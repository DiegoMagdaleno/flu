package = 'Flu'
version = '${version}'
source = {
	url = "git://github.com/DiegoMagdaleno/flu.git",
	tag = "main"
}
description = {
	summary = "Filesystems in Lua Userspace.",
	homepage = 'https://github.com/DiegoMagdaleno/flu/',
	license = 'MIT',
}
external_dependencies = {
	FUSE = {
		library = 'fuse',
	},
	ATTR = {
		header = 'xattr/xattr.h',
	},
}
dependencies = {
	'lua >= 5.1, < 6',
}
build = {
	type = 'builtin',
	modules = {
		['flu'] = {
			sources = {
				'flu.c',
				'errno.c',
				'posix_structs.c',
				'compat.c',
			},
			defines = {
				'FUSE_USE_VERSION=26',
				'FLU_API=LUALIB_API',
				'luaopen_module=luaopen_flu',
			},
			libraries = {
				'fuse',
			},
			libdirs = {
				'$(FUSE_LIBDIR)',
			},
			incdirs = {
				'$(FUSE_INCDIR)',
				'$(ATTR_INCDIR)',
			},
		},
	},
}

-- vi: ft=lua
