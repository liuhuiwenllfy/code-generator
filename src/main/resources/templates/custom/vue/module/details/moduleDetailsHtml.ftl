<#-- @formatter:off -->
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
            <el-form-item>
                <template #label>
                    <strong>${field.columnComment}</strong>
                </template>
        <#if field.uiType?? && (field.uiType == "PICTURE_UPLOAD" || field.uiType == "PROFILE_PICTURE_UPLOAD")>
            <#if field.uiType == "PROFILE_PICTURE_UPLOAD">
            <el-avatar :src="getFileUrl(_data.${field.columnNameHump})" size="large" alt="default.png"/>
            <#elseif field.uiType == "PICTURE_UPLOAD">
            <el-image :src="getFileUrl(_data.${field.columnNameHump})" style="max-width: 200px; max-height: 200px"  alt="default.png"/>
            </#if>
        <#elseif field.uiType?? && field.uiType == "MARKDOWN">
            <ve-md-preview :model-value="_data.${field.columnNameHump}" :theme="commonStore.getDark? 'dark':'light'"></ve-md-preview>
        <#else>
            <el-text type="info">{{ _data.<#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>${field.columnNameHump}Name<#else>${field.columnNameHump}</#if> }}</el-text>
        </#if>
            </el-form-item>
    </#if>
</#list>