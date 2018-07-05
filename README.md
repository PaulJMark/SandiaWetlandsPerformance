# SandiaWetlandsPerformance
Code for generating Appendix D tables and plots for the Sandia Wetlands Performance Monitoring Report
<<<<<<< HEAD

SELECT v_lanl_report_chem.*,  <br/>
  v_lanl_report_chem.location_id_alias AS location_id_alias1 <br/>
FROM v_lanl_report_chem <br/>
WHERE (v_lanl_report_chem.location_id_alias LIKE 'SWA%') OR <br/>
  (v_lanl_report_chem.location_id_alias LIKE 'SCPZ%') OR <br/>
  (v_lanl_report_chem.location_id_alias = 'E121') OR <br/>
  (v_lanl_report_chem.location_id_alias = 'E122') OR <br/>
  (v_lanl_report_chem.location_id_alias = 'E123') OR <br/>
  (v_lanl_report_chem.location_id_alias = 'NPDES Outfall 001') <br/>
  
This file is saved in the shared Github repository PaulJMark/SandiaWetlandsPerformance.
  
Go to the shared directory. Click on the file. Download to a local directory.
  
Unzip the file into your local directory.  Run the following code and observe 103,954 analytical records are present
=======
>>>>>>> 057950f37732d042bf6b043b019e7f40bbb853ee
