Class BI.ZEN.MsgTabel Extends %ZEN.Component.page
{

Parameter APPLICATION;

Parameter PAGENAME = "Table Pane Test Page";

Parameter DOMAIN;

XData Style
{
<style type="text/css">
.labelText {
	padding: 2px;
	background: white;
	color: darkblue;
	border: 1px solid black;
	height: 1.0em;
	width: 12.0em;
}

#table {
	border: 1px solid darkblue;
}
 table.tpTable caption {
    border: none;
    background: #ccc;
    color: #fff;
}
table.tpTable th {
    border-right: none;
    border-bottom:none;
    background: #abbbca;
    color: #fff;
}
table.tpTable td {
    border-right: none;
    font-weight: normal;
    font-size:12px;
    font-family: "微软雅黑";
}
.fieldSetDisabled {
    color: #101010;
    background: #eee;
}
.fieldSetDisabled legend {
    color: #101010;
    background: #eee;
    font-size: 20px;
}
.tpEven {
    color: darkblue;
    background: #c4e3f3;
}

</style>
}

/// This XML defines the contents of this page.
XData Contents [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<page xmlns="http://www.intersystems.com/zen"  title="tablePane Test Page">
<vgroup>
<spacer height="5"/>
<hgroup width="100%">
<tablePane id="table" 
	caption="消息展示"
	tableName="BI_TB.AlertMsg"
	useSnapshot="true"
	
	showFilters="true"
	fixedHeaders="true"
	bodyHeight="20.0em"
	ondblclick="alert(zenThis.getProperty('selectedIndex'));"
	filtersDisabled="false"
	autoExecute="true"
	multiSelect="false"
	showZebra="true"
	pageSize="30"
	showRowNumbers="true"
	valueColumn="ID"
	maxRows="10000"
	useKeys="true"
	 
	onupdate="zenPage.updatePagingInfo();"
	onselectrow="zenPage.rowSelected(zenThis);"
	onunselectrow="zenPage.rowUnselected(zenThis);"
	
	>
<parameter id="P1" value="B"/>
<column colName="ID" hidden="true"/>
<column header="事件时间" colName="createTime"   width="10%" filterType="text"  />
<column header="医院名称" colName="hospitalID"  width="15%" filterType="text"  filterOp="%STARTSWITH" />
<column header="告警组件"  colName="sourceConfigName" width="10%"  />
<column header="告警内容"  colName="context" width="40%"  title="true"/>
<column header="会话ID" colName="sessionId" width="8%" cellTitle="备注信息" />
<column header="接收人" colName="UserNameList"  width="10%" filterType="text"  filterOp="["/>

<!-->
<column header="钉钉ID" colName="DDID" width="20%" filterType="text" filterOp="%STARTSWITH"	/>
<column header="微信ID" colName="WXID" id="wxColumn"  width="20%" filterType="text" 	filterOp="%STARTSWITH"/>
<column header="电话号码"  colName="UserTelList" width="10%" 	filterType="text" />
<column header="Email"  colName="UserEmailList" width="10%" filterType="text" />
<-->
<condition colName="Name" predicate="CONTAINS" value="K" rowStyle="background: #A0A0F0;"/>
<condition colName="Active" predicate="EQ" value="1" rowStyle="font-weight: bold;"/>
</tablePane>
</hgroup>
<tableNavigator tablePaneId="table"/>
<spacer height="5"/>
</vgroup>
<spacer width="25"/>
</page>
}

/// Create the result set used by the table pane.
/// <var>pInfo</var> holds details on how to create the query.
Method CreateRS(Output tSC As %Status, pInfo As %ZEN.Auxiliary.QueryInfo) As %ResultSet
{
	Set tRS = ""
	Set tSC = $$$OK
	
	Set tTOP = "TOP 10000"
	Set tSELECT = "ID, Comment, UserDDID, UserEmail, UserID, UserIdentity, UserName, UserTel, UserType, UserWXID"
	Set tFROM = "JHIP_Project_TB.USERS"
	Set tORDERBY = pInfo.sortColumn
	Set tSORTORDER = pInfo.sortOrder
	Set tWHERE = ""

	// Build WHERE clause based on filters
	If ($G(pInfo.filters("UserName"))'="") {
		;Set tWHERE = tWHERE _ $S(tWHERE="":"",1:" AND ") _ "UserName %MATCHES '" _ pInfo.filters("UserName") _ "'"
	}
	If ($G(pInfo.filters("UserID"))'="") {
		Set tWHERE = tWHERE _ $S(tWHERE="":"",1:" AND ") _ "UserID %MATCHES '" _ pInfo.filters("UserID") _ "'"
	}
	If ($G(pInfo.filters("UserTel"))'="") {
		Set tWHERE = tWHERE _ $S(tWHERE="":"",1:" AND ") _ "UserTel %STARTSWITH '" _ pInfo.filters("UserTel") _ "'"
	}
	If ($G(pInfo.filters("UserWXID"))'="") {
		Set tWHERE = tWHERE _ $S(tWHERE="":"",1:" AND ") _ "UserWXID %STARTSWITH '" _ pInfo.filters("UserWXID") _ "'"
	}

	Set sql = "SELECT " _ tTOP _ " " _ tSELECT _ " FROM " _ tFROM
	Set:tWHERE'="" sql = sql _ " WHERE " _tWHERE
	Set:tORDERBY'="" sql = sql _ " ORDER BY " _tORDERBY _ $S(tSORTORDER="desc":" desc",1:"")

	Set tRS = ##class(%ResultSet).%New()
	Set tSC = tRS.Prepare(sql)
	Set pInfo.queryText = sql
	
	Set pInfo.rowCount = "UNKNOWN" // !!!
	
	Quit tRS
}

Method %OnAfterCreatePage() As %Status
{


	Quit $$$OK
}

ClientMethod rowSelected() [ Language = javascript ]
{
}

/// User click on custom title filter
ClientMethod setTitleFilter(value) [ Language = javascript ]
{
	var table = this.getComponentById('table');
	table.setFilterValue('Title',value);
	table.applyFilters();
}

/// Refresh contents of the table
ClientMethod refreshTable() [ Language = javascript ]
{
	var table = this.getComponentById('table');
	table.setProperty('parameters',1,'C');
}

/// Restore saved set of filter values.
ClientMethod restoreFilters() [ Language = javascript ]
{
	var table = this.getComponentById('table');
	
	if (null == this.filterState) {
		alert('No saved filter state found.');
	}
	else {
		table.setColumnFilters(this.filterState);
	}
}

/// User unselected the current row in the table
ClientMethod rowUnselected() [ Language = javascript ]
{
	var table = this.getComponentById('table');
	var ctrl = this.getComponentById('selectedIndex');
	var idx = table.getProperty('selectedIndex');
	if (idx<0) {
		ctrl.setValue("");
		var ctrl = this.getComponentById('value');
		ctrl.setValue("");
	}
}

/// This callback is called at the start of the HTML BODY section of the page.<br>
/// (default implementation is a simple expression).
Method %OnDrawHTMLBody() As %Status
{
	Write "<!-- GETIO ",$$$GETIO," -->",!
	Quit $$$OK
}

}

