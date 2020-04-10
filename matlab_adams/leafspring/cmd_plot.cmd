if condition = ( "request" == "results" )
file request read  &
   file_name = "file://E:/ADAMS/test_20180313BuildFiles/test_20180313_leaf.req"  &
     &
    &
   disk_based_results = no  &
    &
    
else
file request read  &
   file_name = "file://E:/ADAMS/test_20180313BuildFiles/test_20180313_leaf.req"  &
     &
    &
   disk_based_results = no  &
    &
   
File Name: E:/ADAMS/test_20180313BuildFiles/test_20180313_leaf.req   Time Steps: 56  Start Time: 0.0   Stop Time: 18.2077  (sec)
end ! IF
!
if condition = (("request"=="analysis")||("request"=="request"))
  interface plot panel mode_set mode = request
elseif condition = ("request"=="results")
  interface plot panel mode_set mode = result
end ! IF
!
if condition = (("request"=="analysis")||("request"=="graphics"))
   interface plot window load_view  &
      analysis_name = (eval( db_default( .system_defaults, "analysis" )))
end ! IF ON results or graphics
interface plot panel reload
interface tree_navigator refresh=TRUE