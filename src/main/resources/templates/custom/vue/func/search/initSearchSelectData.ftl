<#-- @formatter:off -->
onMounted(() => {
    EventBus.on(EventName.REFRESH, (e: any) => {
        setPageInfo(_data.value, e);
        if (e && e['parentId']) {
            _data.value.parentId = e['parentId']
        }
        onSubmit()
    })
<#--    初始化选择组件内容-->
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP")>
            <#if field.isShowDict!false>
                <#if field.dictGroup??>
    _${field.columnNameHump}()
                </#if>
            <#else>
                <#if field.associatedTableBigHump??>
    _${field.columnNameHump}()
                </#if>
            </#if>
        <#elseif field.uiType == "TREE_SELECTION">
    _${tableInfo.tableNameHump}Tree()
        </#if>
    </#if>
</#list>
    onSubmit()
})