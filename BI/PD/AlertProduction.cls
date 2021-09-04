Class BI.PD.AlertProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="BI.PD.AlertProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="BI.DeepSee.DashbordMetrics" Category="" ClassName="BI.DeepSee.DashbordMetrics" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">5</Setting>
  </Item>
</Production>
}

}

