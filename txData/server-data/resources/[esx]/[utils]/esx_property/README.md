# esx_property with logs
- All Credits Go To https://github.com/esx-framework/

- Modified Version Of https://github.com/esx-framework/esx_property with logs.

 Includes Logs For Item/Money/Weapon Transfer In And Out

 IMAGES OF THE LOGS:
- https://gyazo.com/62f15aedd649625e24399bc1b83b0c9b
- https://gyazo.com/fbafa34b297b36d4af0d1b7f3eedd584

## https://discord.gg/jsARZZQ For More Scripts Like This

### Requirements

- [async](https://github.com/ESX-Org/async)
- [instance](https://github.com/ESX-Org/instance)
- [cron](https://github.com/ESX-Org/cron)
- [esx_addonaccount](https://github.com/ESX-Org/esx_addonaccount)
- [esx_addoninventory](https://github.com/ESX-Org/esx_addoninventory)
- [esx_datastore](https://github.com/ESX-Org/esx_datastore)


## Download & Installation

### Using [fvm](https://github.com/qlaffont/fvm-installer)
```
fvm install --save --folder=esx Mqasim14/esx_property
```

### Using Git
```
cd resources
git clone https://github.com/Mqasim14/esx_property [esx]/esx_property
```

### Manually
- Download https://codeload.github.com/Mqasim14/esx_property/zip/main
- Put it in the `[esx]` directory

## Installation
- Import `esx_property.sql` in your database
- Import `esx_offices.sql` in your database if you want offices (The Arcadius Business Centre is not included because realstateagentjob)
- Set Webhook In server/main.lua at the top
- Add this to your `server.cfg`:

```
start esx_property
```
