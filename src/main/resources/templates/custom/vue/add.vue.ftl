<#-- @formatter:off -->
<script lang="ts" setup>
import {FormInstance} from 'element-plus/es'
import {computed, reactive, ref, watch} from 'vue'
import {FormRules} from 'element-plus'
import {${tableInfo.tableNameGreatHump}InsertDto} from '@/interface/dto/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}InsertDto'
import {useCommonStore} from "@/pinia/common";
<#include "/custom/vue/module/add/moduleAddImport.ftl" />

const commonStore = useCommonStore();

const props = defineProps({
    dialogVisible: {
        type: Boolean,
        required: true,
        default: () => false
    }
})
<#--初始化选择组件内容-->
<#include "/custom/vue/func/add/initAddSelectData.ftl" />

<#--初始化新增表单-->
<#include "/custom/vue/func/add/initAddForm.ftl" />

<#--初始化表单验证规则-->
<#include "/custom/vue/func/add/initAddFormRules.ftl" />

const emits = defineEmits(['closed', 'onSubmit'])

const closed = (formEl: FormInstance | any) => {
    formEl?.resetFields()
    emits('closed')
}

<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
const ${field.columnNameHump}VeMdEditorRef = ref()
        <#break>
        </#if>
    </#if>
</#list>

<#--初始化表单提交函数-->
const submitForm = async (formEl: FormInstance | any) => {
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
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
<#--组件函数-->
<#include "/custom/vue/module/add/moduleAddFunc.ftl" />
</script>

<template>
    <el-dialog
            v-model="props.dialogVisible"
            destroy-on-close
            draggable
<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
            fullscreen
        <#break>
        </#if>
    </#if>
</#list>
            width="500px"
            @closed="closed(formRef)">
        <template #header>
            {{ $t('message.add') }}
        </template>
        <el-form
                ref="formRef"
                :model="_data"
                :rules="rules"
                label-position="top">
<#--组件html-->
<#include "/custom/vue/module/add/moduleAddHtml.ftl" />
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
