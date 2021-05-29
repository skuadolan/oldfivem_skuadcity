resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

this_is_a_map 'yes'

data_file 'INTERIOR_PROXY_ORDER_FILE' 'stream/*/interiorproxies.meta'
data_file 'TIMECYCLEMOD_FILE' 'gabz_timecycle_mods_1.xml'
data_file 'DLC_ITYP_REQUEST' 'stream/*/divinity_statue1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/*/patoche_mec1.ytyp'

files { 
    'stream/*/interiorproxies.meta',
    'gabz_timecycle_mods_1.xml'
}

client_script {
    'main.lua',
    'client.lua'
}