$---------------------------------------------------------------------MDI_HEADER
[MDI_HEADER]
 FILE_TYPE     =  'asy'
 FILE_VERSION  =  2.0
 FILE_FORMAT   =  'ASCII'
 HEADER_SIZE   =  9
(COMMENTS)
{comment_string}
'Adams/Car full_vehicle assembly'
$----------------------------------------------------------------ASSEMBLY_HEADER
[ASSEMBLY_HEADER]
 ASSEMBLY_CLASS  =  'full_vehicle'
 TIMESTAMP       =  '2012/08/20,12:21:26'
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
$       Template   : _fsae_frontsusp

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_front_susp.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : suspension
$       Minor Role : rear
$       Template   : _fsae_rearsusp

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_rear_susp.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : steering
$       Minor Role : front
$       Template   : _fsae_steer

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_steering.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : wheel
$       Minor Role : front
$       Template   : _fsae_tire

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_front_tire.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : wheel
$       Minor Role : rear
$       Template   : _fsae_tire

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_rear_tire.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : body
$       Minor Role : any
$       Template   : _fsae_chassis

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_chassis.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : powertrain
$       Minor Role : any
$       Template   : _fsae_powertrain

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_powertrain.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : brake_system
$       Minor Role : any
$       Template   : _fsae_brakes

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_brakes_4Wdisk.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : antirollbar
$       Minor Role : front
$       Template   : _fsae_arb

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_front_arb.sub'
$----------------------------------------------------------------------SUBSYSTEM
[SUBSYSTEM]
$ Subsystem information:
$       Major Role : antirollbar
$       Minor Role : rear
$       Template   : _fsae_arb

 USAGE  =  '<fsae_2012>/subsystems.tbl/fsae_rear_arb.sub'
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
  'Specifies the time that must pass after the throttle_demand=0 before the pd-controller will apply the brakes'
 'brake_ratio                 '  'single    '   'real'     0.55
 'front_brake_max_torque      '  'single    '   'real'     1700000.0
  'maximum front axle brake torque generated with maximum braking signal from driver'
 'rack_ratio                  '  'single    '   'real'     83.3
  'swa to rack displacement ratio in S.I. (rad/meter)'
 'rear_brake_max_torque       '  'single    '   'real'     1000000.0
  'maximum rear axle brake torque generated with maximum braking signal from driver'
 'smart_driver_preview_time   '  'single    '   'real'     0.5
  'Smart driver preview time'
 'steering_ratio              '  'single    '   'real'     8.0
  'steering wheel angle to road wheel angle ratio'
$----------------------------------------------------------------SOLVER_SETTINGS
[SOLVER_SETTINGS]
 INTEGRATOR          =  'gstiff'
 CORRECTOR           =  'modified'
 FORMULATION         =  'I3'
