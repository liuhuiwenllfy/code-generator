<script lang="ts" setup>
import {nextTick, watch, ref} from 'vue'
import {resData} from '@/interface/res'
import {get${tableInfo.tableNameGreatHump}ById} from '@/api/result/${tableInfo.tableNameHump}'
import {${tableInfo.tableNameGreatHump}Vo} from '@/interface/vo/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}Vo'

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

let _data = ref<${tableInfo.tableNameGreatHump}Vo>({
    id: "",
    version: null,
    <#list tableInfo.tableField as tableField>
    <#if tableField.isUpdateParam!false>
    ${tableField.columnNameHump}: <#if tableField.javaType == 'String'>''<#else>null</#if>,
    </#if>
    </#list>
})

const emits = defineEmits(['closed'])

const closed = () => {
    emits('closed')
}

const getById = async (id: string) => {
    const res = <resData>await get${tableInfo.tableNameGreatHump}ById({id: id})
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
            width="500px"
            @closed="closed">
        <template #header>
            详情
        </template>
        <el-form
                :model="_data"
                label-position="top">
            <#list tableInfo.tableField as tableField>
                <#if tableField.isUpdateParam!false>
            <el-form-item>
                <template #label>
                    <strong>${tableField.columnComment}</strong>
                </template>
                <el-text type="info">{{ _data.${tableField.columnNameHump} }}</el-text>
            </el-form-item>
                </#if>
            </#list>
        </el-form>
    </el-dialog>

</template>

<style lang="scss" scoped>
</style>
