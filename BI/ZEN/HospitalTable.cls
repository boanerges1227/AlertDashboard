Class BI.ZEN.HospitalTable Extends %ZEN.Component.page
{

Parameter APPLICATION;

Parameter PAGENAME = "Hospital List";

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
#title {
    color: #cbdbeb;
    font-family: "微软雅黑";
    background: #2a3f54;
}
.lookoutButton {
    font-weight: normal;
    font-family: "微软雅黑";
    border: none;
    background: #1abb9c;
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
<page xmlns="http://www.intersystems.com/zen"  title="客户信息维护">

<hgroup>
<vgroup valign="top">
<hgroup width="100%">
<tablePane id="table" 
	caption="客户信息维护"
	tableName="BI_TB.HOSPITAL"
	useSnapshot="true"
	
	showFilters="true"
	fixedHeaders="true"
	multiSelect="false"
	bodyHeight="15.0em"
	ondblclick="alert(zenThis.getProperty('selectedIndex'));"
	filtersDisabled="false"
	autoExecute="true"

	showZebra="true"
	pageSize="10"
	showRowNumbers="true"
	valueColumn="ID"
	maxRows="10000"
	useKeys="true"

	onupdate="zenPage.updatePagingInfo();"
	
	>
<parameter id="P1" value="B"/>
<column colName="ID" hidden="true"/>

<column header="客户名称" colName="HospitalName" id="HospitalNameColumn"  width="35%" filterType="text" />
<column header="等级" colName="Levels" id="Levels"  width="35%" filterType="text" />
<column header="床位数" colName="BedCount" id="BedCount"  width="35%" filterType="text" />
<column header="所在省份" colName="Address" id="Address"  width="35%" filterType="text" />
<column header="备注" colName="Comment" width="30%" cellTitle="备注信息"/>
<column header="操作"  linkCaption="编辑" width="10%"  onclick="zenPage.rowEdit()" link="#" cellTitle="编辑这条数据" />
<condition colName="Name" predicate="CONTAINS" value="K" rowStyle="background: #A0A0F0;"/>
<condition colName="Active" predicate="EQ" value="1" rowStyle="font-weight: bold;"/>
</tablePane>
</hgroup>
<tableNavigator tablePaneId="table"/>
<spacer height="5"/>
</vgroup>
</hgroup>

</page>
}

Method %OnDrawHTMLBody() As %Status
{
	Write "<!-- GETIO ",$$$GETIO," -->",!
	Quit $$$OK
}

}

