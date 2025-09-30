<#-- @formatter:off -->
const _data = ref<${tableInfo.tableNameGreatHump}PageDto>({
    page: 1,
    pageSize: 10,
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType == "DATE_RANGE_SELECTION_BOX">
    ${field.columnNameHump}Stat: '',
    ${field.columnNameHump}End: '',
        <#elseif field.uiType == "DATE_SELECTION_BOX">
    ${field.columnNameHump}: '',
        <#else>
    ${field.columnNameHump}: <#if field.javaType == 'String'>''<#else>null</#if>,
        </#if>
    </#if>
</#list>
})