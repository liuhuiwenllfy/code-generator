<#-- @formatter:off -->
export interface ${tableInfo.tableNameGreatHump}InsertDto {
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
    ${field.columnNameHump}?: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
    </#if>
</#list>
}
