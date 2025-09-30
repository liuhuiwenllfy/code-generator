<#-- @formatter:off -->
watch(() => props.dialogVisible, () => {
    if (props.dialogVisible) {
<#--    初始化选择组件内容-->
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
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
    }
})