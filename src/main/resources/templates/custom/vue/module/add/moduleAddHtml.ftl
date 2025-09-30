<#-- @formatter:off -->
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
            <el-form-item prop="${field.columnNameHump}">
                <template #label>
                    ${field.columnComment}
                </template>
            <#--                文本域-->
            <#if field.uiType?? && field.uiType == "TEXT_FIELD">
                <el-input v-model="_data.${field.columnNameHump}"
                          placeholder="请输入${field.columnComment}"
                          type="textarea"
                          clearable/>
            <#--                    数字输入框-->
            <#elseif field.uiType?? && field.uiType == "DIGITAL_INPUT_BOX">
                <el-input-number v-model="_data.${field.columnNameHump}"
                                 :max="9999999999"
                                 :min="0"
                                 controls-position="right"
                                 style="width: 100%"/>
            <#--                    选择框-->
            <#elseif field.uiType?? && field.uiType == "SELECT_BOX">
                <el-select v-model="_data.${field.columnNameHump}"
                           placeholder="请选择${field.columnComment}"
                           clearable>
                    <el-option v-for="(item, index) in _${field.columnNameHump}Ref" :key="index"
                               :label="item.<#if !field.isShowDict!false && field.dropdownValueHump??>${field.dropdownValueHump}<#else>value</#if>" :value="item.<#if !field.isShowDict!false && field.dropdownKeyHump??>${field.dropdownKeyHump}<#else>key</#if>"/>
                </el-select>
            <#--                    单选框组-->
            <#elseif field.uiType?? && field.uiType == "OPTION_GROUP">
                <el-radio-group v-model="_data.${field.columnNameHump}">
                    <el-radio v-for="(item, index) in _${field.columnNameHump}Ref" :key="index" :label="item.<#if field.dropdownKeyHump??>${field.dropdownKeyHump}<#else>key</#if>">{{item.<#if field.dropdownValueHump??>${field.dropdownValueHump}<#else>value</#if>}}</el-radio>
                </el-radio-group>
            <#--                    树形选择-->
            <#elseif field.uiType?? && field.uiType == "TREE_SELECTION">
                <el-tree-select
                        v-model="_data.${field.columnNameHump}"
                        :check-strictly="true"
                        :data="_${tableInfo.tableNameHump}tree"
                        :expand-on-click-node="false"
                        :highlight-current="true"
                        placeholder="请选择${field.columnComment}"
                        :props="defaultProps"
                        :render-after-expand="false"
                        clearable
                        default-expand-all/>
            <#--                    日期选择框-->
            <#elseif field.uiType?? && field.uiType == "DATE_SELECTION_BOX">
                <el-date-picker
                        v-model="_data.${field.columnNameHump}"
                        placeholder="请选择${field.columnComment}"
                        format="YYYY/MM/DD"
                        type="date"
                        value-format="YYYY-MM-DD"
                        clearable/>
            <#--                    日期范围选择框-->
            <#elseif field.uiType?? && field.uiType == "DATE_RANGE_SELECTION_BOX">
                <el-date-picker
                        v-model="_data.${field.columnNameHump}"
                        end-placeholder="请选择开始日期"
                        start-placeholder="请选择结束日期"
                        format="YYYY/MM/DD"
                        type="daterange"
                        value-format="YYYY-MM-DD"
                        clearable/>
            <#--                    标签输入框-->
            <#elseif field.uiType?? && field.uiType == "LABEL_INPUT_FIELD">
                <el-input-tag
                        v-model="_data.${field.columnNameHump}"
                        placeholder="请输入${field.columnComment}"
                        aria-label="输入后请按回车键"
                        clearable/>
            <#--                    头像上传-->
            <#elseif field.uiType?? && field.uiType == "PROFILE_PICTURE_UPLOAD">
                <ve-upload-avatar
                        :api="getUploadUrl()"
                        :authorization="getCookies('authorization')"
                        :file="getFileUrl(_data.${field.columnNameHump})"
                        :language="commonStore.locale"
                        is-cropper
                        @handleSuccess="handle${field.columnNameBigHump}UploadSuccess"/>
            <#--                    图片上传-->
            <#elseif field.uiType?? && field.uiType == "PICTURE_UPLOAD">
                <ve-upload-picture
                        :api="getUploadUrl()"
                        :authorization="getCookies('authorization')"
                        :file="getFileUrl(_data.${field.columnNameHump})"
                        :language="commonStore.locale"
                        is-cropper
                        @handleSuccess="handle${field.columnNameBigHump}UploadSuccess"/>
            <#--                markdown-->
            <#elseif field.uiType?? && field.uiType == "MARKDOWN">
                <ve-md-editor
                        ref="${field.columnNameHump}VeMdEditorRef"
                        :address-prefix="getFileUrl()"
                        :authorization="getCookies('authorization')"
                        :language="commonStore.locale === 'zhCn'? 'zh-CN':'en-US'"
                        :modelValue="_data.${field.columnNameHump}"
                        :placeholder="$t('message.enterParameter', {parameter: '${field.columnComment}'})"
                        :theme="commonStore.dark? 'dark':'light'"
                        :upload-url="getUploadUrl()"/>
            <#--                    输入框-->
            <#else>
                <el-input v-model="_data.${field.columnNameHump}"
                          placeholder="请输入${field.columnComment}"
                          clearable/>
            </#if>
            </el-form-item>
    </#if>
</#list>