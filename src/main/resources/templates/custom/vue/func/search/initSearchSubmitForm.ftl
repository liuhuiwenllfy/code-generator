<#-- @formatter:off -->
const onSubmit = () => {
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType == "DATE_RANGE_SELECTION_BOX">
    if (${field.columnNameHump}.value.length > 0) {
        _data.value.${field.columnNameHump}Stat = ${field.columnNameHump}.value[0] + ' 00:00:00'
        _data.value.${field.columnNameHump}End = ${field.columnNameHump}.value[1] + ' 23:59:59'
    }
        </#if>
    </#if>
</#list>
    emits('onSubmit', _data.value)
}

const onReset = (formEl: FormInstance | undefined | any) => {
    if (!formEl) return
    formEl?.resetFields()
<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType == "DATE_RANGE_SELECTION_BOX">
    ${field.columnNameHump}.value = []
    _data.value.${field.columnNameHump}Stat = ''
    _data.value.${field.columnNameHump}End = ''
        </#if>
    </#if>
</#list>
    emits('onReset', _data.value)
}