<script lang="ts" setup>
import SearchArea from 've-search-area/index.vue'
import {Refresh, Search,} from '@element-plus/icons-vue'
import {onMounted, ref} from 'vue'
import {FormInstance} from 'element-plus/es'
import {${tableInfo.tableNameGreatHump}PageDto} from '@/interface/dto/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}PageDto'
import {createEmitter} from '@/assets/js/eventBus'
import {hasBtnPermission, setPageInfo} from '@/assets/js/common'
<#--选择类组件如果展示字典中的数据，则需要导入DictionaryTypeVo-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && (tableField.uiType == "SELECT_BOX" || tableField.uiType == "OPTION_GROUP" || tableField.uiType == "MULTIPLE_CHECK_BOX_GROUP")>
import {DictionaryTypeVo} from '@/interface/vo/dictionaryInfo/DictionaryTypeVo'
<#break>
</#if>
</#list>
<#list tableInfo.tableField as tableField>
<#if tableField.dictGroup??>
import {queryByDictType} from '@/api/result/dictionary'
<#break>
</#if>
</#list>
<#--树形选择需要导入TreeNode-->
<#list tableInfo.tableField as tableField>
<#if tableField.uiType?? && tableField.uiType == "TREE_SELECTION">
import {TreeNode} from '@/interface/base/TreeNode'
<#break>
</#if>
</#list>

const emitter = createEmitter()

onMounted(() => {
    emitter.on('refresh', (e: any) => {
        setPageInfo(form, e);
        onSubmit()
    })
<#--    初始化选择组件内容-->
<#list tableInfo.tableField as tableField>
<#if tableField.dictGroup??>
    _${tableField.columnNameHump}()
</#if>
</#list>
    onSubmit()
})

onUnmounted(() => {
  emitter.off('refresh')
})

const formRef = ref<FormInstance>()

const form = ref<${tableInfo.tableNameGreatHump}PageDto>({
    page: 1,
    pageSize: 10,
    <#list tableInfo.tableField as tableField>
    <#if tableField.isCondition!false>
    ${tableField.columnNameHump}: <#if tableField.javaType == 'String'>''<#else>null</#if>,
    </#if>
    </#list>
})

const emits = defineEmits(['onSubmit', 'onReset'])

const onSubmit = () => {
    emits('onSubmit', form.value)
}

const onReset = (formEl: FormInstance) => {
    if (!formEl) return
    formEl?.resetFields()
    emits('onReset', form.value)
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
</#if>
</#if>
</#list>
</script>

<template>
    <SearchArea>
        <template #searchBtn>
            <div class="search-btn">
                <el-button
                        v-if="hasBtnPermission('search')"
                        :icon="Search"
                        type="primary"
                        @click="onSubmit">查询
                </el-button>
                <el-button
                        v-if="hasBtnPermission('reset')"
                        :icon="Refresh"
                        plain
                        type="primary"
                        @click="onReset(formRef)">清空
                </el-button>
            </div>
        </template>
        <template #default>
            <el-form ref="formRef" :inline="true" :model="form">
            <#list tableInfo.tableField as tableField>
            <#if tableField.isCondition!false>
                <el-form-item prop="${tableField.columnNameHump}">
                    <template #label>
                        ${tableField.columnComment}
                    </template>
<#--                    选择框-->
                    <#if tableField.uiType?? && tableField.uiType == "SELECT_BOX">
                    <el-select v-model="_data.${tableField.columnNameHump}"
                               placeholder="请选择${tableField.columnComment}"
                               clearable>
                        <el-option v-for="(item, index) in _${tableField.columnNameHump}Ref" :key="index"
                                   :label="item.value" :value="item.key"/>
                    </el-select>
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
        </template>
    </SearchArea>
</template>

<style lang="scss" scoped>
</style>
