<#-- @formatter:off -->
import {BaseInfo} from '@/interface/base/BaseInfo'

export interface ${tableInfo.tableNameGreatHump}Vo extends BaseInfo{
<#list tableInfo.tableField as field>
    <#if field.isShow!false>
        <#if field.columnNameHump != 'id' && field.columnNameHump != 'createUser' && field.columnNameHump != 'createTime' && field.columnNameHump != 'version'>
    ${field.columnNameHump}?: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
        </#if>
    <#elseif field.isShowDetails!false>
        <#if field.columnNameHump != 'id' && field.columnNameHump != 'createUser' && field.columnNameHump != 'createTime' && field.columnNameHump != 'version'>
    ${field.columnNameHump}?: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isShow!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>
    ${field.columnNameHump}Name?: ${field.tsType} <#if field.tsType != 'string'>| null</#if>  // ${field.columnComment}名称
        </#if>
    </#if>
</#list>
}
