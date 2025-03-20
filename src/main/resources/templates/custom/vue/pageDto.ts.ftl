import {PageInfo} from '@/interface/base/PageInfo'

export interface ${tableInfo.tableNameGreatHump}PageDto extends PageInfo {
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
    ${field.columnNameHump}: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
    </#if>
</#list>
}
