import {BaseInfo} from '@/interface/base/BaseInfo'

export interface ${tableInfo.tableNameGreatHump}Vo extends BaseInfo{
<#list tableInfo.tableField as field>
    <#if field.isShow!false>
    ${field.columnNameHump}: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
    </#if>
</#list>
}
