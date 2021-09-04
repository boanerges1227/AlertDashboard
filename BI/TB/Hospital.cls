Class BI.TB.Hospital Extends (%Persistent, %XML.Adaptor) [ SqlTableName = HOSPITAL ]
{

/// 医院名称
Property HospitalName As %String;

/// 床位数
Property BedCount As %String;

/// 医院等级
Property Levels As %String;

/// 所在省份
Property Address As %String;

/// 注释
Property Comment As %String;

Index HPK On HospitalName [ Data = HospitalName, Unique ];

Storage Default
{
<Data name="HospitalDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>HospitalName</Value>
</Value>
<Value name="3">
<Value>BedCount</Value>
</Value>
<Value name="4">
<Value>Levels</Value>
</Value>
<Value name="5">
<Value>Address</Value>
</Value>
<Value name="6">
<Value>Comment</Value>
</Value>
</Data>
<DataLocation>^BI.TB.HospitalD</DataLocation>
<DefaultData>HospitalDefaultData</DefaultData>
<IdLocation>^BI.TB.HospitalD</IdLocation>
<IndexLocation>^BI.TB.HospitalI</IndexLocation>
<StreamLocation>^BI.TB.HospitalS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

