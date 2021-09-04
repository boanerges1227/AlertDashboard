Include Ensemble

Class BI.DeepSee.AlertKPI Extends %DeepSee.KPI
{

Parameter DOMAIN = "Ensemble";

Parameter RESOURCE = "%Ens_Dashboard";

XData KPI [ XMLNamespace = "http://www.boanerges1227.com/deepsee/kpi" ]
{
<kpi xmlns="http://www.intersystems.com/deepsee/kpi"
 name="BI/DeepSee/AlertKPI "
 sourceType="manual"
 caption="AlertKPI"
>
<property name="hospitalID"/>
<property name="HospitalName"/>
<property name="context"/>
<property name="type"/>
<property name="createTime"/>
<property name="sessionId"/>
<property name="sourceConfigName"/>
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

}

