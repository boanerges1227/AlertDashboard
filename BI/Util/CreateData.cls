Class BI.Util.CreateData Extends %RegisteredObject
{

ClassMethod insertData(count As %String) As %Status
{
		;insert into BI_TB.AlertMsg(DDID, UserEmailList, UserNameList, UserTelList, WJID, WXID, context, createTime, destination, hospitalID, sessionId, sourceConfigName, type) value()
		set i=count
		set tSC=$$$OK
 		FOR { 
        	set i=i-1       	
        	q:i=0
			set alertMsg=##class(BI.TB.AlertMsg).%New()
			set hospitalID=$RANDOM(7)
			set alertMsg.hospitalID=$Select(hospitalID'="0":hospitalID,hospitalID="0":"1")
			set alertMsg.context="错误 <Ens>ErrOutConnectExpired: 10.10.10.1: 的 TCP 连接超时期 (5) 已过"
			set alertMsg.createTime=##class(Ens.DataType.UTC).timeUTCtoLocal($ZDT($H,3))
			set alertMsg.sessionId=$RANDOM(1000000)
			set tSC=alertMsg.%Save()
			w i,!
		 }
		 q tSC
}

}

