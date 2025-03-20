import {UpdateInfo} from '@/interface/base/UpdateInfo'

export interface ${tableInfo.tableNameGreatHump}UpdateDto extends UpdateInfo {
<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
    ${field.columnNameHump}: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
    </#if>
</#list>
}
