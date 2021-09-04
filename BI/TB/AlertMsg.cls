Class BI.TB.AlertMsg Extends (%Persistent, %XML.Adaptor)
{

Parameter DSTIME = "AUTO";

/// 医院ID
Property hospitalID As %String;

/// 订阅人姓名列表
Property UserNameList As %String;

/// 错误级别 0告警，1错误，2严重
/// 严重错误通知主管及研发
Property type As %String;

/// 错误正文
Property context As %String(MAXLEN = "");

/// 创建时间
Property createTime As Ens.DataType.UTC;

/// 发生警报的会话
Property sessionId As %String;

/// 发送警报的业务主机的名称
Property sourceConfigName As %String(MAXLEN = 128);

/// 用于指定此警报消息的外部目标的字段
Property destination As %String(MAXLEN = "");

/// 发送目标的微信ID，多个以英文的逗号分隔
Property WXID As %String(MAXLEN = "");

/// 发送目标的ID，多个以英文的逗号分隔
Property WJID As %String(MAXLEN = "");

/// 发送目标的钉钉ID，多个以英文的逗号分隔
Property DDID As %String(MAXLEN = "");

/// 发送目标的电话号码列表，多个以英文的逗号分隔
Property UserTelList As %String(MAXLEN = "");

/// 发送目标的Email列表，多个以英文的逗号分隔
Property UserEmailList As %String(MAXLEN = "");

Storage Default
{
<Data name="AlertMsgDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>hospitalID</Value>
</Value>
<Value name="3">
<Value>UserNameList</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>context</Value>
</Value>
<Value name="6">
<Value>createTime</Value>
</Value>
<Value name="7">
<Value>sessionId</Value>
</Value>
<Value name="8">
<Value>sourceConfigName</Value>
</Value>
<Value name="9">
<Value>destination</Value>
</Value>
<Value name="10">
<Value>WXID</Value>
</Value>
<Value name="11">
<Value>WJID</Value>
</Value>
<Value name="12">
<Value>DDID</Value>
</Value>
<Value name="13">
<Value>UserTelList</Value>
</Value>
<Value name="14">
<Value>UserEmailList</Value>
</Value>
</Data>
<DataLocation>^BI.TB.AlertMsgD</DataLocation>
<DefaultData>AlertMsgDefaultData</DefaultData>
<IdLocation>^BI.TB.AlertMsgD</IdLocation>
<IndexLocation>^BI.TB.AlertMsgI</IndexLocation>
<StreamLocation>^BI.TB.AlertMsgS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

