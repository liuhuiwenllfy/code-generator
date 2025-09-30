<#-- @formatter:off -->
<script lang="ts" setup>
import TableArea from 've-table-area/index.vue'
import TableColumn from 've-table-column/index.vue'
import {tableHeight} from '@/assets/js/tableHeight'
import {CirclePlus, Delete, Document, Edit} from '@element-plus/icons-vue'
import {computed, ref} from 'vue'
import {ElMessage} from 'element-plus'
import {${tableInfo.tableNameGreatHump}Vo} from '@/interface/vo/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}Vo'
import {useCommonStore} from "@/pinia/common";
import {hasBtnPermission} from "@/assets/js/common";
import {EventBus, EventName} from '@/assets/js/eventBus.ts'
<#list tableInfo.tableField as field>
    <#if field.isShowDetails!false>
        <#if field.uiType?? && (field.uiType == "PICTURE_UPLOAD" || field.uiType == "PROFILE_PICTURE_UPLOAD")>
import {getFileUrl} from "@/assets/js/common.ts";
        <#break/>
        </#if>
    </#if>
</#list>

const commonStore = useCommonStore();

const props = defineProps({
    loading: {
        type: Boolean,
        required: true,
        default: () => false
    },
    tableData: {
        type: Array as () => Array<${tableInfo.tableNameGreatHump}Vo>,
        required: true,
        default: () => []
    }
})

const columnList = computed(() => [
<#list tableInfo.tableField as field>
    <#if field.isShow!false>
    {
        sortable: 'custom',
        prop: <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>'${field.columnNameHump}Name'<#else>'${field.columnNameHump}'</#if>,
        <#if field.uiType?? && (field.uiType == "PICTURE_UPLOAD" || field.uiType == "PROFILE_PICTURE_UPLOAD")>
        coverColumn: true,
        </#if>
        label: <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>'${field.columnComment}名称'<#else>'${field.columnComment}'</#if>
    },
    </#if>
</#list>
])

const selected = ref<Array<${tableInfo.tableNameGreatHump}Vo>>([])

const onSelectionChange = (val: ${tableInfo.tableNameGreatHump}Vo[]) => {
    selected.value = val
}

const emits = defineEmits(['onTableClick'])

const handleClick = (type: string, id: string = '') => {
    if (type === 'batchDelete') {
        if (selected.value.length === 0) {
            ElMessage.warning('请选择要删除的数据')
            return
        }
        let idArray = <any[]>[]
        selected.value.forEach(row => idArray.push(row.id))
        id = idArray.join(',')
    }
    emits('onTableClick', type, id)
}

const onSortChange = (column: any) => {
    EventBus.emit(EventName.REFRESH, column)
}

const handleRefresh = () => {
    EventBus.emit(EventName.REFRESH)
}

const _fullScreen = ref(false)

const _tableHeight = ref()

const handleFullScreen = (fullScreen: boolean, tableHeight: number) => {
    _fullScreen.value = fullScreen
    _tableHeight.value = tableHeight
}
</script>

<template>
    <TableArea>
        <template #header>
            <el-button
                    v-if="hasBtnPermission('add')"
                    :icon="CirclePlus"
                    type="primary"
                    @click="handleClick('add')">
                {{ $t('message.add') }}
            </el-button>
            <el-button
                    v-if="hasBtnPermission('batchDelete')"
                    :icon="Delete"
                    plain
                    type="danger"
                    @click="handleClick('batchDelete')">
                {{ $t('message.batchDelete') }}
            </el-button>
        </template>
        <template #main>
            <el-table v-loading="props.loading"
                      :data="props.tableData"
                      :default-sort="{ prop: 'createTime', order: 'descending' }"
                      :height="_fullScreen? _tableHeight: tableHeight"
                      border
                      default-expand-all
                      row-key="id"
                      @sort-change="onSortChange"
                      @selection-change="onSelectionChange">
                <TableColumn
                        :table-height="tableHeight"
                        :index="false"
                        :language="commonStore.locale"
                        :selection="true"
                        :column-list="columnList"
                        region-class="ve-table"
                        @handle-full-screen="handleFullScreen"
                        @handle-refresh="handleRefresh">
<#list tableInfo.tableField as field>
    <#if field.isShow!false>
        <#if field.uiType??>
            <#if field.uiType == "PROFILE_PICTURE_UPLOAD">
                    <template #${field.columnNameHump}="scope">
                        <el-avatar :src="getFileUrl(scope.row.${field.columnNameHump})" size="large" alt="default.png"/>
                    </template>
            <#elseif field.uiType == "PICTURE_UPLOAD">
                    <template #${field.columnNameHump}="scope">
                        <el-image :src="getFileUrl(scope.row.${field.columnNameHump})" style="width: 100px"  alt="default.png"/>
                    </template>
            </#if>
        </#if>
    </#if>
</#list>
                    <template #default="scope">
                        <el-button
                                v-if="hasBtnPermission('details')"
                                :icon="Document"
                                plain
                                size="small"
                                @click="handleClick('details', scope.row.id)">
                            {{ $t('message.details') }}
                        </el-button>
                        <el-button
                                v-if="hasBtnPermission('edit')"
                                :icon="Edit"
                                plain
                                size="small"
                                type="primary"
                                @click="handleClick('edit', scope.row.id)">
                            {{ $t('message.edit') }}
                        </el-button>
                        <el-button
                                v-if="hasBtnPermission('delete')"
                                :icon="Delete"
                                plain
                                size="small"
                                type="danger"
                                @click="handleClick('delete', scope.row.id)">
                            {{ $t('message.delete') }}
                        </el-button>
                    </template>
                </TableColumn>
            </el-table>
            <slot name="pagination"/>
        </template>
    </TableArea>
</template>

<style scoped>

</style>
