Class BI.DeepSee.DashbordMetrics Extends Ens.BusinessMetric [ ClassType = "", ProcedureBlock ]
{

Property HospitalCount As Ens.DataType.Metric(AUTOHISTORY = 10, RANGELOWER = 0, RANGEUPPER = 100, UNITS = "Dollars") [ MultiDimensional ];

Property AlertCount As Ens.DataType.Metric(AUTOHISTORY = 10, RANGELOWER = 0, RANGEUPPER = 10000, UNITS = "Units");

Method OnCalculateMetrics() As %Status
{
		do ##class(BI.Util.CreateData).insertData(2)
		&sql(SELECT COUNT(*) INTO :count FROM BI_TB.AlertMsg)
		set ..AlertCount = count		 
		&sql(DECLARE C1 CURSOR FOR 
			SELECT count(*) as alertCount, a.hospitalID,b.HospitalName INTO :alertCount,:hospitalID,:HospitalName
			FROM BI_TB.AlertMsg a,BI_TB.HOSPITAL b
			where a.hospitalID=b.ID
			group by a.hospitalID)
  		&sql(OPEN C1)
  		&sql(FETCH C1)
 		WHILE (SQLCODE = 0) {	 		
    		 if ..%Instance=HospitalName{
	    		 set ..HospitalCount=alertCount	 
	    		 $$$LOGINFO(..%Instance_"  "_..AlertCount_""_..HospitalCount)   		 
    		 }  		 
    	&sql(FETCH C1)}
 		&sql(CLOSE C1)

		
		Quit $$$OK
}

ClassMethod OnGetInstances(ByRef pInstSet As %String) As %Status
{
	Set pInstSet(1) = "Hospital-A"
	Set pInstSet(2) = "Hospital-B"
	Set pInstSet(3) = "Hospital-C"
	Set pInstSet(4) = "Hospital-D"
	Set pInstSet(5) = "Hospital-E"
	Set pInstSet(7) = "Hospital-F"	 	 
	Quit $$$OK
}

}

