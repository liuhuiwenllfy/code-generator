<#-- @formatter:off -->
const _data = ref<${tableInfo.tableNameGreatHump}UpdateDto>({
    id: "",
<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
    ${field.columnNameHump}: <#if field.javaType == 'String'>''<#else>null</#if>,
    </#if>
</#list>
    version: null
})