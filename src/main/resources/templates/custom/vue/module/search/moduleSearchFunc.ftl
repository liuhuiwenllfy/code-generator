<#-- @formatter:off -->
<#--组件所需函数-->
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType??>
        <#--    选择类型函数内容初始化-->
            <#if field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP">
                <#if field.isShowDict!false>
const _${field.columnNameHump}Ref = ref<DictionaryTypeVo[]>()
                    <#if field.dictGroup??>
const _${field.columnNameHump} = async () => {
    const res = <ResData>await queryByDictType({type: '${field.dictGroup}'})
    if (res.ok) {
        res.data.forEach((item: any) => {
            item.key = parseInt(item.key)
        })
        _${field.columnNameHump}Ref.value = res.data
    }
}
                    </#if>
                <#else>
                    <#if field.associatedTableBigHump??>
const _${field.columnNameHump}Ref = ref<${field.associatedTableBigHump}Vo[]>()
const _${field.columnNameHump} = async () => {
    const res = <ResData>await get${field.associatedTableBigHump}List()
    if (res.ok) {
        _${field.columnNameHump}Ref.value = res.data
    }
}
                    <#else>
const _${field.columnNameHump}Ref = ref<any[]>()
                    </#if>
                </#if>
            </#if>
            <#--    树形选择内容初始化-->
            <#if field.uiType == "TREE_SELECTION">
const defaultProps = {
    value: 'id',
    label: 'name',
    children: 'children',
}

const _${tableInfo.tableNameHump}tree = ref<TreeNode[]>()

const _${tableInfo.tableNameHump}Tree = async () => {
    const res = <ResData>await get${tableInfo.tableNameGreatHump}Tree({showTopNode: true})
    if (res.ok) {
        _${tableInfo.tableNameHump}tree.value = res.data
    }
}
            </#if>
        </#if>
    </#if>
</#list>