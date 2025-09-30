<#-- @formatter:off -->
const _data = ref<${tableInfo.tableNameGreatHump}InsertDto>({
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
    ${field.columnNameHump}: <#if field.javaType == 'String'>''<#else>null</#if>,
    </#if>
</#list>
})