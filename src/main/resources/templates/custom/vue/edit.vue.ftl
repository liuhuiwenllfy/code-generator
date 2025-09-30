<#-- @formatter:off -->
<script lang="ts" setup>
import {FormInstance} from 'element-plus/es'
import {computed, reactive, ref, watch} from 'vue'
<#--上传类型组件需要导入UploadFile-->
import {FormRules} from 'element-plus'
import {${tableInfo.tableNameGreatHump}UpdateDto} from '@/interface/dto/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}UpdateDto'
import {ResData} from '@/interface/ResData'
import {useCommonStore} from "@/pinia/common"
import {get${tableInfo.tableNameGreatHump}ById} from '@/api/result/${tableInfo.tableNameHump}'
<#include "/custom/vue/module/update/moduleUpdateImport.ftl" />

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
<#--初始化选择组件内容-->
<#include "/custom/vue/func/update/initUpdateSelectData.ftl" />

<#--初始化修改表单-->
<#include "/custom/vue/func/update/initUpdateForm.ftl" />

<#--初始化表单验证规则-->
<#include "/custom/vue/func/update/initUpdateFormRules.ftl" />

const emits = defineEmits(['closed', 'onSubmit'])

const closed = (formEl: FormInstance | any) => {
    formEl?.resetFields()
    emits('closed')
}

<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
const ${field.columnNameHump}VeMdEditorRef = ref()
        <#break>
        </#if>
    </#if>
</#list>

<#--初始化表单提交函数-->
const submitForm = async (formEl: FormInstance | any) => {
<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
    _data.value.${field.columnNameHump} = ${field.columnNameHump}VeMdEditorRef.value.getText()
        <#break>
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
    const res = <ResData>await get${tableInfo.tableNameGreatHump}ById({id: id})
    if (res.ok) {
        _data.value = Object.assign(_data.value, res.data)
    }
}
<#--组件函数-->
<#include "/custom/vue/module/update/moduleUpdateFunc.ftl" />
</script>

<template>
    <el-dialog
            v-model="props.dialogVisible"
            destroy-on-close
            draggable
<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
            fullscreen
        <#break>
        </#if>
    </#if>
</#list>
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
<#--组件html-->
<#include "/custom/vue/module/update/moduleUpdateHtml.ftl" />
        </el-form>
        <template #footer>
            <span class="dialog-footer">
                <el-button @click="resetForm(formRef)">{{ $t('message.reset') }}</el-button>
                <el-button :loading="commonStore.loading" type="primary" @click="submitForm(formRef)">{{$t('message.confirm')}}</el-button>
            </span>
        </template>
    </el-dialog>
</template>

<style lang="scss" scoped>
</style>
