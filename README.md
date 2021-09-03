# AlertDashboard
##  Use DeepSee to create a dashboard to show abnormal conditions of Production operation.
######   Device: Raspberry Pi 
######   Version:IRIS for UNIX (Ubuntu Server LTS for ARM64 Containers) 2021.1 (Build 205U) 
1.  open Management Portal,Create new namespace "BI"
1.  open your studio,and Switch to namespace "BI",
1.  Import BI.xml and BI-Dashbord-AlertDashboard.dashboard.xml code file from studio and compile
1.  open Management Portal，switch namespace “BI”，
1.  select【System Explorer】-->【GLOBALS】-->use "import" button,select "export.gof"
1.  go to production,start "BI.PD.AlertProduction"
1.  open http://your-ip:port/csp/healthshare/BI/_DeepSee.UserPortal.DashboardViewer.zen?DASHBOARD=BI/Dashbord/AlertDashboard.dashboard
1.  success!!!
##  Dashboard data is refreshed every 5s




