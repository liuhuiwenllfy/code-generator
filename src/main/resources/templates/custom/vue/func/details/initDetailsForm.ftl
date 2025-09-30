<#-- @formatter:off -->
let _data = ref<${tableInfo.tableNameGreatHump}Vo>({
    id: "",
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
    ${field.columnNameHump}: <#if field.javaType == 'String'>''<#else>null</#if>,
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP")>
        ${field.columnNameHump}Name: <#if field.javaType == 'String'>''<#else>null</#if>,
        </#if>
    </#if>
</#list>
    version: null
})