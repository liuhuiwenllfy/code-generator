<#-- @formatter:off -->
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP")>
import {ResData} from '@/interface/ResData'
        <#break/>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
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
    <#if field.isAddParam!false>
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
    <#if field.isAddParam!false>
        <#if field.uiType?? && (field.uiType == "PROFILE_PICTURE_UPLOAD" || field.uiType == "PICTURE_UPLOAD" || field.uiType == "MARKDOWN")>
import {getCookies} from "@/assets/js/cookiesUtils";
import {getFileUrl, getUploadUrl} from "@/assets/js/common";
            <#break>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
import VeMdEditor from 've-md-editor/ve-md-editor/index.vue'
            <#break>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && field.uiType == "PROFILE_PICTURE_UPLOAD">
import VeUploadAvatar from 've-upload/ve-upload-avatar/index.vue'
            <#break>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && field.uiType == "PICTURE_UPLOAD">
import VeUploadPicture from "ve-upload/ve-upload-picture/index.vue";
            <#break>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && field.uiType == "TREE_SELECTION">
import {get${tableInfo.tableNameGreatHump}Tree} from '@/api/result/${tableInfo.tableNameHump}'
import {TreeNode} from '@/interface/base/TreeNode'
            <#break>
        </#if>
    </#if>
</#list>