resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Police'

client_scripts {
	'config.lua',
	'client/main.lua',
	'client/camera.lua',
}

server_scripts {
	'config.lua',
	'server/main.lua',
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/vue.min.js",
	"html/script.js",
	"html/vcr-ocd.ttf",
}
