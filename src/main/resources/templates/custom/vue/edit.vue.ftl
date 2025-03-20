<script lang="ts" setup>
import {FormInstance} from 'element-plus/es'
import {computed, reactive, ref, watch} from 'vue'
import {FormRules, UploadFile} from 'element-plus'
import {${tableInfo.tableNameGreatHump}UpdateDto} from '@/interface/dto/${tableInfo.tableNameGreatHump}UpdateDto'
import {resData} from '@/interface/res'
import {useCommonStore} from "@/pinia/common";
import {DictionaryTypeVo} from '@/interface/vo/dictionaryInfo/DictionaryTypeVo'
import {TreeNode} from '@/interface/base/TreeNode'

    <#--上传类型组件需要导入UploadFile-->
    <#--选择类组件如果展示字典中的数据，则需要导入DictionaryTypeVo-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && (tableField.uiType == "SELECT_BOX" || tableField.uiType == "OPTION_GROUP" || tableField.uiType == "MULTIPLE_CHECK_BOX_GROUP")>
    <#break>
</#if>
</#list>
<#list tableInfo.tableField as tableField>
<#if tableField.dictGroup??>
    <#break>
</#if>
</#list>
<#--树形选择需要导入TreeNode-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && tableField.uiType == "TREE_SELECTION">
    <#break>
</#if>
</#list>
<#--上传类型组件需要导入getCookies、getFileUrl、getUploadUrl-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && (tableField.uiType == "PROFILE_PICTURE_UPLOAD" || tableField.uiType == "PICTURE_UPLOAD" || tableField.uiType == "BATCH_IMAGE_UPLOAD" || tableField.uiType == "BATCH_FILE_UPLOAD")>
    <#break>
</#if>
</#list>
<#--上传头像需要导入VeUploadAvatar-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && tableField.uiType == "PROFILE_PICTURE_UPLOAD">
    <#break>
</#if>
</#list>
<#--上传图片需要导入VeUploadPicture-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && tableField.uiType == "PICTURE_UPLOAD">
    <#break>
</#if>
</#list>
<#--批量上传图片需要导入VeBatchUploadPicture-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && tableField.uiType == "BATCH_IMAGE_UPLOAD">
    <#break>
</#if>
</#list>
<#--批量上传文件需要导入VeBatchUploadFile-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && tableField.uiType == "BATCH_FILE_UPLOAD">
    <#break>
</#if>
</#list>

const commonStore = useCommonStore();

const props = defineProps({
    dialogVisible: {
        type: Boolean,
        required: true,
        default: () => false
    },
    id: {
        type: String,
        required: true,
        default: () => {}
    }
})

watch(() => props.dialogVisible, () => {
    if (props.dialogVisible) {
<#--    初始化选择组件内容-->
    <#list tableInfo.tableField as tableField>
    <#if tableField.dictGroup??>
        _${tableField.columnNameHump}()
    </#if>
    </#list>
        getById(props.id)
    }
})
<#--初始化新增表单-->
let _data = ref<${tableInfo.tableNameGreatHump}UpdateDto>({
    id: "",
    version: null,
    <#list tableInfo.tableField as tableField>
    <#if tableField.isUpdateParam!false>
    ${tableField.columnNameHump}: <#if tableField.javaType == 'String'>''<#else>null</#if>,
    </#if>
    </#list>
})

const formRef = ref<FormInstance>()
<#--初始化表单验证规则-->
const rules = computed(() => {
    return reactive<FormRules>({
        <#list tableInfo.tableField as tableField>
        <#if tableField.isUpdateParam!false>
        ${tableField.columnNameHump}: [
            {required: true, message: '请输入${tableField.columnComment}', trigger: 'blur'},
            <#if tableField.characterMaximumLength != 0>
            {min: 1, max: ${tableField.characterMaximumLength}, message: '${tableField.columnComment}长度在1~${tableField.characterMaximumLength}之间', trigger: 'blur'},
            </#if>
        ],
        </#if>
        </#list>
    })
})

const emits = defineEmits(['closed', 'onSubmit'])

const closed = (formEl: FormInstance | any) => {
    formEl?.resetFields()
    emits('closed')
}

const submitForm = async (formEl: FormInstance | any) => {
<#--    批量上传图片需要转换-->
    <#list tableInfo.tableField as tableField>
    <#if tableField.uiType??>
    <#if tableField.uiType == "BATCH_IMAGE_UPLOAD">
    picture${tableField.columnNameBigHump}List.value.map((item: UploadFile) => {
        _data.value.${tableField.columnNameHump}.push({
          name: item.name,
          size: item.size || 0,
          // @ts-ignore
          url: item.response.data,
          status: 'success',
          uuid: item.uid
        })
    })
<#--    批量上传文件需要转换-->
    <#elseif tableField.uiType == "BATCH_FILE_UPLOAD">
    file${tableField.columnNameBigHump}List.value.map((item: UploadFile) => {
        _data.value.${tableField.columnNameHump}.push({
          name: item.name,
          size: item.size || 0,
          // @ts-ignore
          url: item.response.data,
          status: 'success',
          uuid: item.uid
        })
    })
    </#if>
    </#if>
    </#list>
    if (!formEl) return
    await formEl.validate((valid: any) => {
        if (valid) {
            emits('onSubmit', _data.value)
        }
    })
}

const resetForm = (formEl: FormInstance | any) => {
    if (!formEl) return
    formEl?.resetFields()
}

const getById = async (id: string) => {
    const res = <resData>await get${tableInfo.tableNameGreatHump}ById({id: id})
    if (res.ok) {
        _data.value = Object.assign(_data.value, res.data)
    }
}

<#--组件所需函数-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType??>
<#--    选择类型函数内容初始化-->
<#if tableField.uiType == "SELECT_BOX" || tableField.uiType == "OPTION_GROUP" || tableField.uiType == "MULTIPLE_CHECK_BOX_GROUP">
const _${tableField.columnNameHump}Ref = ref<DictionaryTypeVo[]>()
<#if tableField.dictGroup??>
const _${tableField.columnNameHump} = async () => {
  const res = <resData>await queryByDictType({type: '${tableField.dictGroup}'})
  if (res.ok) {
    res.data.forEach((item: any) => {
      item.key = parseInt(item.key)
    })
    _${tableField.columnNameHump}Ref.value = res.data
  }
}
</#if>
<#--    树形选择内容初始化-->
<#elseif tableField.uiType == "TREE_SELECTION">
const _${tableField.columnNameHump}tree = ref<TreeNode[]>()

const ${tableField.columnNameHump}Tree = async () => {
  // TODO 查询树接口
  const res = <resData>await get${tableField.columnNameHump}Tree({showTopNode: true})
  if (res.ok) {
    _${tableField.columnNameHump}tree.value = res.data
  }
}
<#--上传头像、上传图片成功回调-->
<#elseif tableField.uiType == "PROFILE_PICTURE_UPLOAD" || tableField.uiType == "PICTURE_UPLOAD">
const handle${tableField.columnNameBigHump}UploadSuccess = (response: any) => {
  _data.value.${tableField.columnNameHump} = response.data
}
<#--批量上传图片回调和删除图片回调-->
<#elseif tableField.uiType == "BATCH_IMAGE_UPLOAD">
const picture${tableField.columnNameBigHump}List = ref<UploadFile[]>([])

const handle${tableField.columnNameBigHump}PictureSuccess = (file: UploadFile) => {
  picture${tableField.columnNameBigHump}List.value.push(file)
}

const handle${tableField.columnNameBigHump}PictureRemove = (file: UploadFile) => {
  picture${tableField.columnNameBigHump}List.value = picture${tableField.columnNameBigHump}List.value.filter(item => item.uid !== file.uid)
}
<#--批量上传文件回调和删除文件回调-->
<#elseif tableField.uiType == "BATCH_FILE_UPLOAD">
const file${tableField.columnNameBigHump}List = ref<UploadFile[]>([])

const handle${tableField.columnNameBigHump}FileSuccess = (file: UploadFile) => {
  file${tableField.columnNameBigHump}List.value.push(file)
}

const handle${tableField.columnNameBigHump}FileRemove = (file: UploadFile) => {
  file${tableField.columnNameBigHump}List.value = file${tableField.columnNameBigHump}List.value.filter(item => item.uid !== file.uid)
}
</#if>
</#if>
</#list>
</script>

<template>
    <el-dialog
            v-model="props.dialogVisible"
            destroy-on-close
            draggable
            width="500px"
            @closed="closed(formRef)">
        <template #header>
            {{ $t('message.edit') }}
        </template>
        <el-form
                ref="formRef"
                :model="_data"
                :rules="rules"
                label-position="top"
                width="500px">
            <#list tableInfo.tableField as tableField>
            <#if tableField.isUpdateParam!false>
            <el-form-item prop="${tableField.columnNameHump}">
                <template #label>
                    ${tableField.columnComment}
                </template>
<#--                文本域-->
                <#if tableField.uiType?? && tableField.uiType == "TEXT_FIELD">
                <el-input v-model="_data.${tableField.columnNameHump}"
                          placeholder="请输入${tableField.columnComment}"
                          type="textarea"
                          clearable/>
<#--                    数字输入框-->
                <#elseif tableField.uiType?? && tableField.uiType == "DIGITAL_INPUT_BOX">
                <el-input-number v-model="_data.${tableField.columnNameHump}"
                                 :max="9999999999"
                                 :min="0"
                                 controls-position="right"
                                 style="width: 100%"/>
<#--                    选择框-->
                <#elseif tableField.uiType?? && tableField.uiType == "SELECT_BOX">
                <el-select v-model="_data.${tableField.columnNameHump}"
                           placeholder="请选择${tableField.columnComment}"
                           clearable>
                    <el-option v-for="(item, index) in _${tableField.columnNameHump}Ref" :key="index"
                               :label="item.value" :value="item.key"/>
                </el-select>
<#--                    单选框组-->
                <#elseif tableField.uiType?? && tableField.uiType == "OPTION_GROUP">
                <el-radio-group v-model="_data.${tableField.columnNameHump}">
                    <el-radio v-for="(item, index) in _${tableField.columnNameHump}Ref" :key="index"
                              :label="item.key">{{item.value}}
                    </el-radio>
                </el-radio-group>
<#--                    多选框组-->
                <#elseif tableField.uiType?? && tableField.uiType == "MULTIPLE_CHECK_BOX_GROUP">
                <el-checkbox-group v-model="_data.${tableField.columnNameHump}">
                    <el-checkbox v-for="(item, index) in _${tableField.columnNameHump}Ref" :key="index"
                                 :label="item.key">{{item.value}}
                    </el-checkbox>
                </el-checkbox-group>
<#--                    树形选择-->
                <#elseif tableField.uiType?? && tableField.uiType == "TREE_SELECTION">
                <el-tree-select
                    v-model="_data.${tableField.columnNameHump}"
                    :check-strictly="true"
                    :data="_${tableField.columnNameHump}tree"
                    :expand-on-click-node="false"
                    :highlight-current="true"
                    placeholder="请选择${tableField.columnComment}"
                    :props="defaultProps"
                    :render-after-expand="false"
                    clearable
                    default-expand-all/>
<#--                    日期选择框-->
                <#elseif tableField.uiType?? && tableField.uiType == "DATE_SELECTION_BOX">
                <el-date-picker
                    v-model="_data.${tableField.columnNameHump}"
                    placeholder="请选择${tableField.columnComment}"
                    format="YYYY/MM/DD"
                    type="date"
                    value-format="YYYY-MM-DD"
                    clearable/>
<#--                    日期范围选择框-->
                <#elseif tableField.uiType?? && tableField.uiType == "DATE_RANGE_SELECTION_BOX">
                <el-date-picker
                    v-model="_data.${tableField.columnNameHump}"
                    end-placeholder="请选择开始日期"
                    start-placeholder="请选择结束日期"
                    format="YYYY/MM/DD"
                    type="daterange"
                    value-format="YYYY-MM-DD"
                    clearable/>
<#--                    标签输入框-->
                <#elseif tableField.uiType?? && tableField.uiType == "LABEL_INPUT_FIELD">
                <el-input-tag
                    v-model="_data.${tableField.columnNameHump}"
                    placeholder="请输入${tableField.columnComment}"
                    aria-label="输入后请按回车键"
                    clearable/>
<#--                    头像上传-->
                <#elseif tableField.uiType?? && tableField.uiType == "PROFILE_PICTURE_UPLOAD">
                <ve-upload-avatar
                    :api="getUploadUrl()"
                    :authorization="getCookies('authorization')"
                    :file="getFileUrl(_data.${tableField.columnNameHump})"
                    :language="commonStore.locale"
                    is-cropper
                    @handleSuccess="handle${tableField.columnNameBigHump}UploadSuccess"/>
<#--                    图片上传-->
                <#elseif tableField.uiType?? && tableField.uiType == "PICTURE_UPLOAD">
                <ve-upload-avatar
                    :api="getUploadUrl()"
                    :authorization="getCookies('authorization')"
                    :file="getFileUrl(_data.${tableField.columnNameHump})"
                    :language="commonStore.locale"
                    is-cropper
                    @handleSuccess="handle${tableField.columnNameBigHump}UploadSuccess"/>
<#--                    批量图片上传-->
                <#elseif tableField.uiType?? && tableField.uiType == "BATCH_IMAGE_UPLOAD">
                <ve-batch-upload-picture
                    :api="getUploadUrl()"
                    :authorization="getCookies('access_token')"
                    :file-list="picture${tableField.columnNameBigHump}List"
                    :language="commonStore.locale"
                    is-cropper
                    @handleRemove="handle${tableField.columnNameBigHump}PictureRemove"
                    @handleSuccess="handle${tableField.columnNameBigHump}PictureSuccess"/>
<#--                    批量文件上传-->
                <#elseif tableField.uiType?? && tableField.uiType == "BATCH_FILE_UPLOAD">
                <ve-batch-upload-file
                    :api="getUploadUrl()"
                    :authorization="getCookies('access_token')"
                    :file-list="file${tableField.columnNameBigHump}List"
                    :language="commonStore.locale"
                    is-cropper
                    @handleRemove="handle${tableField.columnNameBigHump}FileRemove"
                    @handleSuccess="handle${tableField.columnNameBigHump}FileSuccess"/>
<#--                    输入框-->
                <#else>
                <el-input v-model="_data.${tableField.columnNameHump}"
                    placeholder="请输入${tableField.columnComment}"
                    clearable/>
                </#if>
            </el-form-item>
            </#if>
            </#list>
        </el-form>
        <template #footer>
      <span class="dialog-footer">
        <el-button @click="resetForm(formRef)">{{ $t('message.reset') }}</el-button>
        <el-button :loading="commonStore.loading" type="primary" @click="submitForm(formRef)">{{
            $t('message.confirm')
          }}</el-button>
      </span>
        </template>
    </el-dialog>
</template>

<style lang="scss" scoped>
</style>
