# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.create([{login: 'edruzhinin', firstname: 'Евгений', secondname: 'Владимирович', lastname: 'Дружинин',email: 'evd@yandex.ru',admin: true, password_digest:'$2a$10$RTcIdghXxRCMj2fcPZTtfe4S1uVfvfYbOX75PhZVUfnYvLdIUqy1W',remember_token: 'feed32b31b54c6d4b78abae8d0b20d0e3a715dd5'},
							{login: 'test1', firstname: 'Первый', secondname: 'Владимирович', lastname: 'Тестер',email: 'evd@yandex.ru', password_digest:'$2a$10$RTcIdghXxRCMj2fcPZTtfe4S1uVfvfYbOX75PhZVUfnYvLdIUqy1W'},
							{login: 'test2', firstname: 'Второй', secondname: 'Владимирович', lastname: 'Тестер',email: 'evd@yandex.ru', password_digest:'$2a$10$RTcIdghXxRCMj2fcPZTtfe4S1uVfvfYbOX75PhZVUfnYvLdIUqy1W'},
						{login: 'test3', firstname: 'Третий', secondname: 'Владимирович', lastname: 'Тестер',email: 'evd@yandex.ru', password_digest:'$2a$10$RTcIdghXxRCMj2fcPZTtfe4S1uVfvfYbOX75PhZVUfnYvLdIUqy1W'}])

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

Vendor.create(name: "VmWare", short_name: "Vm")

SoftwareType.create([{name: 'Гипервизор', sparam1: 'Логин', sparam2: 'Пароль', sparam3: 'Версия', software_type: '1', version: '5.6.0', vendor: Vendor.find_by(name: "VmWare")}])

software_type_esxi = SoftwareType.find_by(name: 'Гипервизор')



current_location=	Location.find_by(name: '3002NET01')
hardwaretype_switch = HardwareType.find_by(name: 'коммутатор')	

hardwaretype_ups =  HardwareType.find_by(name: 'ИБП')
hardwaretype_kvm = HardwareType.find_by(name: 'KVM')
hardwaretype_server  = HardwareType.find_by(name: 'сервер')
hardwaretype_prompc = HardwareType.find_by(name: 'promPC')
hardware_type_desktop = HardwareType.find_by(name: 'Desktop')	

HardwareModel.create(hardware_type: hardwaretype_switch, name: "HP V1900-24", modelNo:  "JD990A")
HardwareModel.create(hardware_type: hardwaretype_switch, name: "Cisco Catalyst 2950C-24", modelNo:  "2950C")
HardwareModel.create(hardware_type: hardwaretype_switch, name: "Cisco Catalyst 2950C-12", modelNo:  "2950C")
HardwareModel.create(hardware_type: hardwaretype_switch, name: "MRV Optiswitch-800", modelNo: "800F")

HardwareModel.create(hardware_type: hardwaretype_ups, name: "APC Smart-UPS 3000 XLM", modelNo: "3000XLM")

HardwareModel.create(hardware_type: hardwaretype_kvm, name: "KVM")

HardwareModel.create(hardware_type: hardwaretype_server, name: "HP Proliant DL580 Gen5", modelNo: "DL580")
HardwareModel.create(hardware_type: hardwaretype_server, name: "HP Proliant DL380G5", modelNo: "DL380G5")

Hardware.create(hardware_model: HardwareModel.find_by(name: "HP V1900-24"), serial_number: "CN12BWN0L",identificator: "К942", location: current_location, iparam1: "24", el_power: "196" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "Cisco Catalyst 2950C-24"), serial_number: "FOC0742Y482",identificator: "К482", location: current_location, iparam1: "24", el_power: "30" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "Cisco Catalyst 2950C-12"),serial_number: "FCZ1132714W",identificator: "К714", location: current_location, iparam1: "12", el_power: "30" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "Cisco Catalyst 2950C-12"), serial_number: "FAB0543W2HK",inv_number: "1-000251",identificator: "К251", location: current_location, iparam1: "12", el_power: "30" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "Cisco Catalyst 2950C-12"), serial_number: "FCZ11407213",inv_number: "1-000273",identificator: "К251", location: current_location, iparam1: "12", el_power: "30" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "MRV Optiswitch-800"), inv_number: "1-000169",identificator: "К169",ip_adr_adm: "192.168.110.20",login: "mrv",password: "a", location: current_location, el_power: "310" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "MRV Optiswitch-800"), inv_number: "1-000170",identificator: "К170",ip_adr_adm: "192.168.110.21",login: "mrv",password: "a", location: current_location, el_power: "310" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "MRV Optiswitch-800"), inv_number: "1-000171",identificator: "К171",ip_adr_adm: "192.168.110.22",login: "mrv",password: "a", location: current_location, el_power: "310" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "APC Smart-UPS 3000 XLM"), ip_adr_adm: "192.168.110.7", location: current_location, el_power: "2400" )

current_location=	Location.find_by(name: '3002PROLIANT01')

Hardware.create(hardware_model: HardwareModel.find_by(name: "KVM"),inv_number: "1-000207",serial_number: "ASI07G0157",identificator: "KVM157",password: "00000000", location: current_location, el_power: "50" )
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL580 Gen5"),inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828", location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" )	
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL380G5"),inv_number: "1-000241",serial_number: "CZC7424SJD",identificator: "К482",ip_adr_adm: "10.15.180.131", location: current_location, sparam1: "2xXeon 3,06GHz", el_power: "850" )	
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL380G5"),inv_number: "1-000241",serial_number: "CZC7424SJL",identificator: "К482",ip_adr_adm: "10.15.180.132", location: current_location, sparam1: "2xXeon 3,06GHz", el_power: "850" )	




Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL580 Gen5"),name: "esxiSrv1",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.204",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create( software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL580 Gen5"),name: "esxiSrv2",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.205",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create( software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL580 Gen5"),name: "esxiSrv3",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.206",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create( software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL580 Gen5"),name: "esxiSrv4",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.214",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create( software_type: software_type_esxi, sparam1: "root", sparam2: "31415926pls")
Hardware.create(hardware_model: HardwareModel.find_by(name: "HP Proliant DL580 Gen5"),name: "esxiSrv5",inv_number: "1-000207",serial_number: "GB874622YM",identificator: "К482",ip_adr_adm: "192.168.110.20",login: "root",password: "271828",ip_adr: "192.168.107.217",location: current_location, sparam1: "2xXeon E7310@1.6GHz", el_power: "2400" ).softwares.create( software_type: software_type_esxi, sparam1: "root", sparam2: "31415926Pls")


srv1 = Hardware.find_by(name: "esxiSrv1")
Vmhost.create(hardware: srv1, name: "esxi-srv1", esxi_version: "VMware ESXi 5.5.0 build-2068190", cpu_count: 2, cpu_core_count: 12,cpu_usage: 99, cpu_ghz: 3, memory_size: 96,memory_usage: 45, hardware_description: "Intel(R) Xeon(R) CPU           X5675  @ 3.07GHz", powerState:1, cpu_usage_percent: "0", memory_free_percent: "90")
vmhost=Vmhost.find_by(name: "esxi-srv1")
Vmdatasource.create(vmhost: vmhost, ds_id: "vim.Datastore:5474d385-fa498c9b-986d-441ea15f6930", ds_name: "DataStore1", ds_status: 1, ds_url: "/vmfs/volumes/5474d385-fa498c9b-986d-441ea15f6930", ds_type: "VMFS", ds_accessible: true, ds_capacity: 513517027328/1024/1024, ds_freespace: 11582570496/1024/1024, ds_uncommited: 87578162815/1024/1024) 
Vmdatasource.create(vmhost: vmhost, ds_id: "vim.Datastore:172.16.181.251:/data/nfs", ds_name: "DSVU_NFS", ds_status: 1, ds_url: "/vmfs/volumes/43ad14e3-5e03c6c7", ds_type: "NFS", ds_accessible: true, ds_capacity: 2952418435072/1024/1024, ds_freespace: 2478806786048/1024/1024, ds_uncommited: 0) 
Vmresourcepool.create(vmhost: vmhost,name: "Resource",status: 1)
rootres = Vmresourcepool.find_by(vmhost: vmhost, name: "Resource")
Vmresourcepool.create(vmhost: vmhost,name: "TC_test_alarm_AES-2006",status: 1,parent_id: rootres.id)
Vmresourcepool.create(vmhost: vmhost,name: "Pool 2",status: 1,parent_id: rootres.id)
vmres =  Vmresourcepool.find_by(vmhost: vmhost, name: "TC_test_alarm_AES-2006")
Vm.create(vmresourcepool: vmres, name: "10CFL10GJ502", guest: "Other Linux (64-bit)", uuid: "527431dc-8d01-1c65-f91c-27cbfad4a0cd", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "[DataStore1] Gate_RO1_A/Gate_RO1_A.vmx")
Vm.create(vmresourcepool: vmres, name: "Windows XP", guest: "Microsoft Windows XP Professional (32-bit)", uuid: "52e63a49-7de4-50cf-79cb-0dc7626336d8", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "[DataStore1] 20CKM20/20CKM20.vmx")
Vm.create(vmresourcepool: vmres, name: "WS3", guest: "www", uuid: "123123-3131-3131-3131-3103", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS4", guest: "www", uuid: "123123-3131-3131-3131-3104", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: false, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS5", guest: "www", uuid: "123123-3131-3131-3131-3105", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1" )
Vm.create(vmresourcepool: vmres, name: "WS6", guest: "www", uuid: "123123-3131-3131-3131-3106", state: 0, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS7", guest: "www", uuid: "123123-3131-3131-3131-3107", state: -1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS8", guest: "www", uuid: "123123-3131-3131-3131-3108", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS9", guest: "www", uuid: "123123-3131-3131-3131-3109", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS10", guest: "www", uuid: "123123-3131-3131-3131-3110", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")
Vm.create(vmresourcepool: vmres, name: "WS11", guest: "www", uuid: "123123-3131-3131-3131-3111", state: 1, ip: "127.0.0.1", annotation: "First VM", vmtools: true, path: "DataStore1")




srv1 = Hardware.find_by(name: "esxiSrv2")
Vmhost.create(hardware: srv1,name: "esxi-srv2", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1, cpu_usage_percent: "100", memory_free_percent: "0")

srv1 = Hardware.find_by(name: "esxiSrv3")
Vmhost.create(hardware: srv1,name: "esxi-srv3", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1, cpu_usage_percent: "59", memory_free_percent: "75")

srv1 = Hardware.find_by(name: "esxiSrv4")
Vmhost.create(hardware: srv1,name: "esxi-srv4", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1, cpu_usage_percent: "95", memory_free_percent: "95")

srv1 = Hardware.find_by(name: "esxiSrv5")
Vmhost.create(hardware: srv1,name: "esxi-srv5", esxi_version: "5.5", cpu_count: 2, cpu_core_count: 12, memory_size: 96, powerState:1, cpu_usage_percent: "75", memory_free_percent: "75")

