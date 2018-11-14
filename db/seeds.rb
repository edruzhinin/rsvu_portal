# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create([{name: '3002NET01'} ,{name: '3002PC01'},{name: '3002PROLIANT01'},{name: '3002ITANIUMT01'},{name: '3002ALPHA01'}])
HardwareType.create([{name: 'коммутатор', iparam1: 'Количество портов'},
											{name: 'сервер',sparam1: 'CPU', iparam1: 'Объем памяти'},
											{name: 'promPC',sparam1: 'CPU', iparam1: 'Объем памяти'},
											{name: 'Desktop',sparam1: 'CPU', iparam1: 'Объем памяти'},
											{name: 'ИБП',iparam1: 'Нагрузка'},
											{name: 'KVM'}])
											
DeviceType.create([{name: 'HDD', iparam1: 'Объем', sparam1: 'Интерфейс'},
										{name: 'Сетевая карта', sparam1: 'MAC', sparam2: 'IP'},
										{name: 'Модуль GigabitOver Copper'},
										{name: 'Модуль 8-port 10/100Base-TX Uplink'},
										{name: 'Модуль AC power supply'},
										{name: 'Корпус'}])

SoftwareType.create([{name: 'Гипервизор', sparam1: 'Логин', sparam2: 'Пароль', sparam3: 'Версия'}])

software_type_esxi = SoftwareType.find_by(name: 'Гипервизор')



current_location=	Location.find_by(name: '3002NET01')
current_hardwaretype = HardwareType.find_by(name: 'коммутатор')	

hardwaretype_ups =  HardwareType.find_by(name: 'ИБП')
hardwaretype_kvm = HardwareType.find_by(name: 'KVM')
hardwaretype_server  = HardwareType.find_by(name: 'сервер')
hardwaretype_prompc = HardwareType.find_by(name: 'promPC')
hardware_type_desktop = HardwareType.find_by(name: 'Desktop')	


Hardware.create(hardware_type: current_hardwaretype, name: "HP V1900-24",model: "JD990A",serial_number: "CN12BWN0L",identificator: "К942", location: current_location, iparam1: "24", el_power: "196" )
Hardware.create(hardware_type: current_hardwaretype, name: "Cisco Catalyst 2950C-24",model: "2950C",serial_number: "FOC0742Y482",identificator: "К482", location: current_location, iparam1: "24", el_power: "30" )
Hardware.create(hardware_type: current_hardwaretype, name: "Cisco Catalyst 2950C-12",model: "2950C",serial_number: "FCZ1132714W",identificator: "К714", location: current_location, iparam1: "12", el_power: "30" )
Hardware.create(hardware_type: current_hardwaretype, name: "Cisco Catalyst 2950C-12",model: "2950C",serial_number: "FAB0543W2HK",inv_number: "1-000251",identificator: "К251", location: current_location, iparam1: "12", el_power: "30" )
Hardware.create(hardware_type: current_hardwaretype, name: "Cisco Catalyst 2950C-12",model: "2950C",serial_number: "FCZ11407213",inv_number: "1-000273",identificator: "К251", location: current_location, iparam1: "12", el_power: "30" )
Hardware.create(hardware_type: current_hardwaretype, name: "MRV Optiswitch-800",model: "800F",inv_number: "1-000169",identificator: "К169",ip_adr_adm: "192.168.110.20",login: "mrv",password: "a", location: current_location, el_power: "310" )
Hardware.create(hardware_type: current_hardwaretype, name: "MRV Optiswitch-800",model: "800F",inv_number: "1-000170",identificator: "К170",ip_adr_adm: "192.168.110.21",login: "mrv",password: "a", location: current_location, el_power: "310" )
Hardware.create(hardware_type: current_hardwaretype, name: "MRV Optiswitch-800",model: "800F",inv_number: "1-000171",identificator: "К171",ip_adr_adm: "192.168.110.22",login: "mrv",password: "a", location: current_location, el_power: "310" )
Hardware.create(hardware_type: hardwaretype_ups, name: "APC Smart-UPS 3000 XLM",model: "3000XLM",ip_adr_adm: "192.168.110.7", location: current_location, el_power: "2400" )

current_location=	Location.find_by(name: '3002PROLIANT01')

Hardware.create(hardware_type: hardwaretype_kvm, name: "KVM",inv_number: "1-000207",serial_number: "ASI07G0157",identificator: "KVM157",password: "00000000", location: current_location, el_power: "50" )
Hardware.create(hardware_type: hardwaretype_server, name: "HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828", location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" )	
Hardware.create(hardware_type: hardwaretype_server, name: "HP Proliant DL380G5",model: "DL380G5",inv_number: "1-000241",serial_number: "CZC7424SJD",identificator: "К482",ip_adr_adm: "10.15.180.131", location: current_location, sparam1: "2xXeon 3,06GHz", el_power: "850" )	
Hardware.create(hardware_type: hardwaretype_server, name: "HP Proliant DL380G5",model: "DL380G5",inv_number: "1-000241",serial_number: "CZC7424SJL",identificator: "К482",ip_adr_adm: "10.15.180.132", location: current_location, sparam1: "2xXeon 3,06GHz", el_power: "850" )	


device_type_hdd = DeviceType.find_by(name:'HDD')

srv1 = Hardware.find_by(name: "HP Proliant DL580 Gen5")

Device.create(hardware: srv1, device_type: device_type_hdd, name: "Диск 1", description: "Система", sparam1: "SAS", iparam1: "72")
Device.create(hardware: srv1, device_type: device_type_hdd, name: "Диск 2", description: "Архив", sparam1: "SAS", iparam1: "72")


Hardware.create(hardware_type: hardwaretype_server, name: "VM1 HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.204",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create(name: 'esxi-4', software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_type: hardwaretype_server, name: "VM2 HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.205",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create(name: 'esxi-5', software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_type: hardwaretype_server, name: "VM3 HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.206",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create(name: 'esxi-6', software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_type: hardwaretype_server, name: "VM4 HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.212",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create(name: 'esxi-12', software_type: software_type_esxi, sparam1: "root", sparam2: "31415926Pls")
Hardware.create(hardware_type: hardwaretype_server, name: "VM5 HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.214",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create(name: 'esxi-14', software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_type: hardwaretype_server, name: "VM6 HP Proliant DL580 Gen5",model: "DL580",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.217",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create(name: 'esxi-17', software_type: software_type_esxi, sparam1: "root", sparam2: "31415926Pls")


srv1 = Hardware.find_by(name: "VM1 HP Proliant DL580 Gen5")
Vmhost.create(hardware: srv1,name: "esxi-srv1", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1)
vmhost=Vmhost.find_by(name: "esxi-srv1")
Vmresourcepool.create(vmhost: vmhost,name: "Resource",status: 1)
rootres = Vmresourcepool.find_by(vmhost: vmhost, name: "Resource")
Vmresourcepool.create(vmhost: vmhost,name: "Pool 1",status: 1,parent_id: rootres.id)
Vmresourcepool.create(vmhost: vmhost,name: "Pool 2",status: 1,parent_id: rootres.id)
vmres =  Vmresourcepool.find_by(vmhost: vmhost, name: "Pool 1")
Vm.create(vmresourcepool: vmres, name: "WS1", guest: "www", uuid: "123123-3131-3131-3131-3101", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS2", guest: "www", uuid: "123123-3131-3131-3131-3102", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS3", guest: "www", uuid: "123123-3131-3131-3131-3103", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS4", guest: "www", uuid: "123123-3131-3131-3131-3104", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: false, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS5", guest: "www", uuid: "123123-3131-3131-3131-3105", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS6", guest: "www", uuid: "123123-3131-3131-3131-3106", state: 0, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS7", guest: "www", uuid: "123123-3131-3131-3131-3107", state: -1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS8", guest: "www", uuid: "123123-3131-3131-3131-3108", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS9", guest: "www", uuid: "123123-3131-3131-3131-3109", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS10", guest: "www", uuid: "123123-3131-3131-3131-3110", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS11", guest: "www", uuid: "123123-3131-3131-3131-3111", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")




srv1 = Hardware.find_by(name: "VM2 HP Proliant DL580 Gen5")
Vmhost.create(hardware: srv1,name: "esxi-srv2", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1)

srv1 = Hardware.find_by(name: "VM3 HP Proliant DL580 Gen5")
Vmhost.create(hardware: srv1,name: "esxi-srv3", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1)

srv1 = Hardware.find_by(name: "VM4 HP Proliant DL580 Gen5")
Vmhost.create(hardware: srv1,name: "esxi-srv4", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1)

srv1 = Hardware.find_by(name: "VM1 HP Proliant DL580 Gen5")
Vmhost.create(hardware: srv1,name: "esxi-srv5", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1)

srv1 = Hardware.find_by(name: "VM1 HP Proliant DL580 Gen5")
Vmhost.create(hardware: srv1,name: "esxi-srv6", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1)