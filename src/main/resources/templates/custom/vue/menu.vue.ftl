<#-- @formatter:off -->
<script lang="ts" setup>
import {nextTick, onMounted, onUnmounted, ref} from 'vue'
import {ResData} from '@/interface/ResData.ts'
import {initMenuHeight, menuHeight} from '@/assets/js/menuHeight.ts'
import {get${tableInfo.tableNameGreatHump}Tree} from '@/api/result/${tableInfo.tableNameHump}'
import {TreeNode} from '@/interface/base/TreeNode'
import {EventBus, EventName} from '@/assets/js/eventBus.ts'

const searchInput = ref()

onMounted(() => {
    EventBus.on(EventName.MENU_REFRESH, () => {
        getTree()
    })
    getTree()
    nextTick(() => {
        initMenuHeight(searchInput)
    })
})

onUnmounted(() => {
    EventBus.off(EventName.MENU_REFRESH)
})

const query = ref('')

const treeRef = ref()
const onQueryChanged = (query: string) => {
    treeRef.value!.filter(query)
}

const prop = {
    value: 'id',
    label: 'name',
    children: 'children',
}

const filterMethod = (query: string, node: TreeNode) => {
    return node.name!.includes(query)
}

const menuTree = ref<TreeNode[]>()

const getTree = async () => {
    const res = <ResData>await get${tableInfo.tableNameGreatHump}Tree()
    if (res.ok) {
        menuTree.value = res.data
    }
}

const nodeClick = (data: TreeNode) => {
    EventBus.emit(EventName.REFRESH, {parentId: data.id})
}
</script>

<template>
    <el-input
            ref="searchInput"
            v-model="query"
            :placeholder="$t('message.enter')"
            clearable
            @input="onQueryChanged"/>
    <el-tree-v2
            ref="treeRef"
            :data="menuTree"
            :default-expanded-keys="['0']"
            :expand-on-click-node="false"
            :filter-method="filterMethod"
            :height="menuHeight"
            :highlight-current="true"
            :props="prop"
            @node-click="nodeClick"/>
</template>

<style lang="scss" scoped>
.el-tree {
    ::v-deep(.el-tree-virtual-list) {
        overflow-y: hidden !important;
    }
}
</style>
