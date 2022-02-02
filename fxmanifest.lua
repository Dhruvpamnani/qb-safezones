fx_version 'cerulean'
games { 'gta5' }

author 'MaDHouSe'
description 'Savezones'
version '1.0.0'


shared_scripts {
	'@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
}


client_script {
    'client/main.lua',
    'client/events.lua',
    'client/threads.lua',
    'client/functions.lua',
}

server_script {
    'server/update.lua'
}