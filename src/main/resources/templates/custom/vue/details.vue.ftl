<#-- @formatter:off -->
<script lang="ts" setup>
import {nextTick, watch, ref} from 'vue'
import {ResData} from '@/interface/ResData'
import {get${tableInfo.tableNameGreatHump}ById} from '@/api/result/${tableInfo.tableNameHump}'
import {${tableInfo.tableNameGreatHump}Vo} from '@/interface/vo/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}Vo'
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
        <#if field.uiType?? && (field.uiType == "PICTURE_UPLOAD" || field.uiType == "PROFILE_PICTURE_UPLOAD")>
import {getFileUrl} from "@/assets/js/common.ts";
        <#break/>
        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
import {useCommonStore} from "@/pinia/common.ts";
import VeMdPreview from 've-md-editor/ve-md-preview/index.vue'

const commonStore = useCommonStore();
        <#break>
        </#if>
    </#if>
</#list>

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
    nextTick(() => {
        getById(props.id)
    })
})
<#--初始化详情表单-->
<#include "/custom/vue/func/details/initDetailsForm.ftl" />

const emits = defineEmits(['closed'])

const closed = () => {
    emits('closed')
}

const getById = async (id: string) => {
    const res = <ResData>await get${tableInfo.tableNameGreatHump}ById({id: id})
    if (res.ok) {
        _data.value = Object.assign(_data.value, res.data)
    }
}
</script>

<template>
    <el-dialog
            v-model="props.dialogVisible"
            destroy-on-close
            draggable
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
        <#if field.uiType?? && field.uiType == "MARKDOWN">
            fullscreen
        <#break>
        </#if>
    </#if>
</#list>
            width="500px"
            @closed="closed">
        <template #header>
            {{ $t('message.details') }}
        </template>
        <el-form
                :model="_data"
                label-position="top">
<#--初始化组件html-->
<#include "/custom/vue/module/details/moduleDetailsHtml.ftl" />
        </el-form>
    </el-dialog>

</template>

<style lang="scss" scoped>
</style>
