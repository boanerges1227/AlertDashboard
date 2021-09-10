Class BI.DeepSee.AlertKPI Extends %DeepSee.KPI
{

Parameter DOMAIN = "Ensemble";

Parameter RESOURCE = "%Ens_Dashboard";

XData KPI [ XMLNamespace = "http://www.boanerges1227.com/deepsee/kpi" ]
{
<kpi name="BI/DeepSee/AlertKPI "
 sourceType="sql"
 caption="AlertKPI"

>

<property name="HospitalName" columnNo="1"/>
<property name="createTime" columnNo="2"/>
<property name="context" columnNo="3"/>

<property name="type" columnNo="4"/>

<property name="sessionId" columnNo="5"/>
<property name="sourceConfigName" columnNo="6"/>
</kpi>
}

Method %OnLoadKPI() As %Status
{
	
	//to-do coding........
	q $$$OK
}

ClassMethod %OnDashboardAction(pAction As %String, pContext As %ZEN.proxyObject) As %Status
{
	// pAction is the name of the action (as defined in the XML list).
	// pContext contains information from the client
	// and can be used to return information.
	Quit $$$OK
}

Method %OnGetSQL(ByRef pSQL As %String) As %Status
{
	 Set pSQL ="SELECT top 50 b.HospitalName ,createTime,context,  destination,  sessionId, sourceConfigName, type	FROM BI_TB.AlertMsg a,BI_TB.HOSPITAL b where a.hospitalID=b.ID order by a.createTime desc"

    
   
	Quit $$$OK
}

}

