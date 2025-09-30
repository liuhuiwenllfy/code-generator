<#-- @formatter:off -->
const formRef = ref<FormInstance>()
const rules = computed(() => {
    return reactive <FormRules>({
<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
        ${field.columnNameHump}: [
        <#if field.isRequiredField!false>
            {required: true, message: '请输入${field.columnComment}', trigger: 'blur'},
        </#if>
        <#if field.characterMaximumLength != 0>
            {min: 1, max: ${field.characterMaximumLength}, message: '${field.columnComment}长度在1~${field.characterMaximumLength}之间', trigger: 'blur'},
        </#if>
        ],
    </#if>
</#list>
    })
})