<#-- @formatter:off -->
import {PageInfo} from '@/interface/base/PageInfo'

export interface ${tableInfo.tableNameGreatHump}PageDto extends PageInfo {
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType == "DATE_RANGE_SELECTION_BOX">
    ${field.columnNameHump}Stat?: string  // ${field.columnComment}开始日期
    ${field.columnNameHump}End?: string  // ${field.columnComment}结束日期
        <#elseif field.uiType == "DATE_SELECTION_BOX">
    ${field.columnNameHump}?: string  // ${field.columnComment}
        <#else>
    ${field.columnNameHump}?: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
        </#if>
    </#if>
</#list>
}
