$---------------------------------------------------------------------MDI_HEADER
[MDI_HEADER]
 FILE_TYPE     =  'asy'
 FILE_VERSION  =  1.0
 FILE_FORMAT   =  'ASCII'
 HEADER_SIZE   =  9
(COMMENTS)
{comment_string}
'Adams Car full_vehicle assembly'
$----------------------------------------------------------------ASSEMBLY_HEADER
[ASSEMBLY_HEADER]
 ASSEMBLY_CLASS  =  'full_vehicle'
 TIMESTAMP       =  '2009/09/25,18:31:18'
 HEADER_SIZE     =  5
$------------------------------------------------------------------------PLUGINS
[PLUGINS]
 PLUGIN_LIST  =  'acar'
 HEADER_SIZE  =  4
$--------------------------------------------------------------------------UNITS
[UNITS]
 LENGTH  =  'mm'
 FORCE   =  'newton'
 ANGLE   =  'deg'
 MASS    =  'kg'
 TIME    =  'sec'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : suspension
$       Minor Role : front
$       Template   : _double_wishbone

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Front_Suspension.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : suspension
$       Minor Role : rear
$       Template   : _double_wishbone

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Rear_Suspension.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : steering
$       Minor Role : front
$       Template   : _rack_pinion_steering

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Steering.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : wheel
$       Minor Role : front
$       Template   : _handling_tire

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Front_Tires.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : wheel
$       Minor Role : rear
$       Template   : _handling_tire

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Rear_Tires.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : body
$       Minor Role : any
$       Template   : _rigid_chassis

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Body.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : powertrain
$       Minor Role : rear
$       Template   : _powertrain

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Powertrain.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : brake_system
$       Minor Role : any
$       Template   : _brake_system_4Wdisk

 USAGE  =  'mdids://acar_shared/subsystems.tbl/TR_Brake_System.sub'
$------------------------------------------------------------------------TESTRIG
[TESTRIG]
 USAGE  =  '__MDI_SDI_TESTRIG'

$----------------------------------------------------------------------HARDPOINT
[HARDPOINT]
{hardpoint_name                  symmetry         x_value    y_value    z_value}
 'path_error_reference        '  'single    '        0.0         0.0         0.0
 'upright_reference           '  'left/right'        0.0         0.0         0.0
$----------------------------------------------------------------------PARAMETER
[PARAMETER]
{parameter_name                  symmetry       type       value}
 'initial_engine_rpm          '  'single    '   'real'     2000.0
 'throttle_lag_brake_demand   '  'single    '   'real'     0.1
 'brake_ratio                 '  'single    '   'real'     0.55
 'front_brake_max_torque      '  'single    '   'real'     1700000.0
 'rack_ratio                  '  'single    '   'real'     174.5
 'rear_brake_max_torque       '  'single    '   'real'     1000000.0
 'smart_driver_preview_time   '  'single    '   'real'     0.5
 'steering_ratio              '  'single    '   'real'     27.6
$----------------------------------------------------------------SOLVER_SETTINGS
[SOLVER_SETTINGS]
 INTEGRATOR          =  'gstiff'
 FORMULATION         =  'I3'
