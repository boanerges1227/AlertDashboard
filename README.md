# AlertDashboard
##  Use DeepSee to create a dashboard to show abnormal conditions of Production operation.
######   Device: Raspberry Pi 
######   Version:IRIS for UNIX (Ubuntu Server LTS for ARM64 Containers) 2021.1 (Build 205U) 
1.  open Management Portal,Create new namespace "BI"
1.  open your studio,and Switch to namespace "BI",
2.  Download all contents under the BI folder，import all  OR Import BI.xml and BI/Dashbord/BI-Dashbord-AlertDashboard.dashboard.xml code file from studio and compile
4.  open Management Portal，switch namespace “BI”，
5.  select【System Explorer】-->【GLOBALS】-->use "import" button,select "export.gof"
6.  go to production,start "BI.PD.AlertProduction"
7.  open SMP in namespace BI Analytics > User Portal >  Alert Dashboard
8.  success!!!
##  Dashboard data is refreshed every 5s




