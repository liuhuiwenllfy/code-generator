<#-- @formatter:off -->
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType??>
            <#if field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION">
import {ResData} from '@/interface/ResData'
                <#break>
            </#if>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP")>
            <#if field.isShowDict!false>
                <#if field.dictGroup??>
import {DictionaryTypeVo} from '@/interface/vo/dictionaryInfo/DictionaryTypeVo'
import {queryByDictType} from '@/api/result/dictionary'
                    <#break>
                </#if>
            </#if>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP")>
            <#if field.isShowDict!false>
            <#else>
                <#if field.associatedTableBigHump?? && field.associatedTableHump??>
import {${field.associatedTableBigHump}Vo} from '@/interface/vo/${field.associatedTableHump}/${field.associatedTableBigHump}Vo'
import {get${field.associatedTableBigHump}List} from '@/api/result/${field.associatedTableHump}'
                </#if>
            </#if>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType?? && field.uiType == "TREE_SELECTION">
import {get${tableInfo.tableNameGreatHump}Tree} from '@/api/result/${tableInfo.tableNameHump}'
import {TreeNode} from '@/interface/base/TreeNode'
            <#break>
        </#if>
    </#if>
</#list>