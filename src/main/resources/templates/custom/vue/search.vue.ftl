<#-- @formatter:off -->
<script lang="ts" setup>
import SearchArea from 've-search-area/index.vue'
import {Refresh, Search,} from '@element-plus/icons-vue'
import {onMounted, ref, onUnmounted} from 'vue'
import {FormInstance} from 'element-plus/es'
import {${tableInfo.tableNameGreatHump}PageDto} from '@/interface/dto/${tableInfo.tableNameHump}/${tableInfo.tableNameGreatHump}PageDto'
import {EventBus, EventName} from '@/assets/js/eventBus.ts'
import {hasBtnPermission, setPageInfo} from '@/assets/js/common'
<#include "/custom/vue/module/search/moduleSearchImport.ftl" />

<#--初始化选择组件内容-->
<#include "/custom/vue/func/search/initSearchSelectData.ftl" />

onUnmounted(() => {
  EventBus.off(EventName.REFRESH)
})

const formRef = ref<FormInstance>()

<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType?? && field.uiType == "DATE_RANGE_SELECTION_BOX">
const ${field.columnNameHump} = ref([])
        </#if>
    </#if>
</#list>

<#--初始化搜索表单-->
<#include "/custom/vue/func/search/initSearchForm.ftl" />

const emits = defineEmits(['onSubmit', 'onReset'])

<#--初始化表单提交函数-->
<#include "/custom/vue/func/search/initSearchSubmitForm.ftl" />

<#--组件函数-->
<#include "/custom/vue/module/search/moduleSearchFunc.ftl" />
</script>

<template>
    <SearchArea>
        <template #searchBtn>
            <div class="search-btn">
                <el-button
                        v-if="hasBtnPermission('search')"
                        :icon="Search"
                        type="primary"
                        @click="onSubmit">{{ $t('message.search') }}
                </el-button>
                <el-button
                        v-if="hasBtnPermission('reset')"
                        :icon="Refresh"
                        plain
                        type="primary"
                        @click="onReset(formRef)">{{ $t('message.reset') }}
                </el-button>
            </div>
        </template>
        <template #default>
            <el-form ref="formRef" :inline="true" :model="_data">
<#--组件html-->
<#include "/custom/vue/module/search/moduleSearchHtml.ftl" />
            </el-form>
        </template>
    </SearchArea>
</template>

<style lang="scss" scoped>
</style>
