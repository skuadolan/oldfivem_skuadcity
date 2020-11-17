resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file "TYPE" "FILENAME"

data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/vehiclelayouts.meta'

files {
    'data/vehicles.meta',
    'data/carcols.meta',
    'data/carvariations.meta',
    'data/handling.meta'--[[,
    'data/vehiclelayouts.meta']]
  }
  
  client_script {
    'client/vehicle_names.lua'
  }