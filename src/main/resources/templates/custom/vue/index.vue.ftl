<script lang="ts" setup>
import Search from '@/view/${basicParameter.moduleName}/${tableInfo.tableNameHump}/search/index.vue'
import Table from '@/view/${basicParameter.moduleName}/${tableInfo.tableNameHump}/table/index.vue'
import Pagination from 've-pagination/index.vue'
import Details from '@/view/${basicParameter.moduleName}/${tableInfo.tableNameHump}/dialog/details/index.vue'
import Add from '@/view/${basicParameter.moduleName}/${tableInfo.tableNameHump}/dialog/add/index.vue'
import Edit from '@/view/${basicParameter.moduleName}/${tableInfo.tableNameHump}/dialog/edit/index.vue'
import {nextTick, ref} from 'vue'
import {resData} from '@/interface/res'
import {ElMessageBox} from 'element-plus'
import {initTableHeight} from '@/assets/js/tableHeight'
import {
    delete${tableInfo.tableNameGreatHump},
    get${tableInfo.tableNameGreatHump}ByPage,
    insert${tableInfo.tableNameGreatHump},
    update${tableInfo.tableNameGreatHump}
} from '@/api/result/${tableInfo.tableNameHump}'
import {createEmitter} from '@/assets/js/eventBus'
import {${tableInfo.tableNameGreatHump}Vo} from '@/interface/vo/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}Vo'
import {initPageHeight} from "@/assets/js/pageHeight";
import {${tableInfo.tableNameGreatHump}InsertDto} from "@/interface/dto/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}InsertDto";
import {${tableInfo.tableNameGreatHump}UpdateDto} from "@/interface/dto/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}UpdateDto";

const emitter = createEmitter()

const pageRef = ref()
const searchRef = ref()
const tableRef = ref()
nextTick(() => {
    initTableHeight(pageRef, searchRef, tableRef, 0)
    initPageHeight(pageRef, 0)
})

const onSubmit = (form: any) => {
    getTableData(form)
}

const onReset = (form: any) => {
    getTableData(form)
}

const detailsDialogVisible = ref(false)

const addDialogVisible = ref(false)

const editDialogVisible = ref(false)

const selected = ref()

const onTableClick = (type: any, id: String) => {
    switch (type) {
        case 'details':
            selected.value = id
            detailsDialogVisible.value = true
            break
        case 'add':
            addDialogVisible.value = true
            break
        case 'edit':
            selected.value = id
            editDialogVisible.value = true
            break
        case 'delete':
        case 'batchDelete':
            onDelete(id)
            break
        default:
            console.warn('Button type cannot be empty')
            break
    }
}

const onAdd = async (${tableInfo.tableNameHump}InsertDto: ${tableInfo.tableNameGreatHump}InsertDto) => {
    const res = <resData>await insert${tableInfo.tableNameGreatHump}(${tableInfo.tableNameHump}InsertDto)
    if (res.ok) {
        addDialogVisible.value = false
        emitter.emit('refresh')
    }
}

const onEdit = async (${tableInfo.tableNameHump}UpdateDto: ${tableInfo.tableNameGreatHump}UpdateDto) => {
    const res = <resData>await update${tableInfo.tableNameGreatHump}(${tableInfo.tableNameHump}UpdateDto)
    if (res.ok) {
        editDialogVisible.value = false
        emitter.emit('refresh')
    }
}

const onDelete = (id: String) => {
    ElMessageBox.confirm('确认要删除吗？', '警告', {confirmButtonText: '确认', cancelButtonText: '取消', type: 'warning'}).then(async () => {
        const res = <resData>await delete${tableInfo.tableNameGreatHump}({idList: id})
        if (res.ok) {
            emitter.emit('refresh')
        }
    }).catch(() => {})
}

const pageSize = ref(10)

const handleSizeChange = (val: number) => {
    pageSize.value = val
    emitter.emit('refresh', {pageSize: val})
}

const current = ref(1)

const handleCurrentChange = (val: number) => {
    current.value = val
    emitter.emit('refresh', {page: val})
}

const tableLoading = ref(false)

const tableData = ref<${tableInfo.tableNameGreatHump}Vo[]>([])

const total = ref(0)

const getTableData = async (form: {}) => {
    tableLoading.value = true
    const res = <resData>await get${tableInfo.tableNameGreatHump}ByPage(form)
    tableLoading.value = false
    if (res.ok) {
        tableData.value = res.data.records
        total.value = res.data.total
    }
}
</script>

<template>
    <div ref="pageRef" class="page">
        <Search ref="searchRef" @onReset="onReset" @onSubmit="onSubmit"/>
        <Table ref="tableRef"
               :loading="tableLoading"
               :tableData="tableData"
               @onTableClick="onTableClick">
            <template #pagination>
                <Pagination
                        :current="current"
                        :pageSize="pageSize"
                        :total="total"
                        @handleCurrentChange="handleCurrentChange"
                        @handleSizeChange="handleSizeChange"/>
            </template>
        </Table>

        <Details :id="selected" :dialogVisible="detailsDialogVisible" @closed="detailsDialogVisible = false"/>

        <Add :dialogVisible="addDialogVisible" @closed="addDialogVisible = false" @onSubmit="onAdd"/>

        <Edit :id="selected" :dialogVisible="editDialogVisible" @closed="editDialogVisible = false" @onSubmit="onEdit"/>
    </div>
</template>

<style lang="scss" scoped>

</style>
