import {get, post, put, remove} from '@/api/http-server'

const api = '${basicParameter.api!"api"}';

/**
 * 条件分页查询${tableInfo.tableComment!}
 * @param params
 */
export const get${tableInfo.tableNameGreatHump}ByPage = (params = {}) => {
    return get(`/${r"${api}"}/${basicParameter.moduleName}/${tableInfo.tableNameHump}/getByPage`, params)
}

/**
 * 新增${tableInfo.tableComment!}
 * @param data
 */
export const insert${tableInfo.tableNameGreatHump} = (data = {}) => {
    return post(`/${r"${api}"}/${basicParameter.moduleName}/${tableInfo.tableNameHump}/insert`, data)
}

/**
 * 修改${tableInfo.tableComment!}
 * @param data
 */
export const update${tableInfo.tableNameGreatHump} = (data = {}) => {
    return put(`/${r"${api}"}/${basicParameter.moduleName}/${tableInfo.tableNameHump}/updateById`, data)
}

/**
 * 根据id查询${tableInfo.tableComment!}
 * @param params
 */
export const get${tableInfo.tableNameGreatHump}ById = (params = {}) => {
    return get(`/${r"${api}"}/${basicParameter.moduleName}/${tableInfo.tableNameHump}/queryById`, params)
}

<#if tableInfo.isGenerateTreeSelect!false>
/**
 * 查询${tableInfo.tableComment!}树结构
 * @param params
 */
export const get${tableInfo.tableNameGreatHump}Tree = (params = {}) => {
    return get(`/${r"${api}"}/${basicParameter.moduleName}/${tableInfo.tableNameHump}/getTree`, params)
}
</#if>

/**
 * 批量删除${tableInfo.tableComment!}
 * @param params
 */
export const delete${tableInfo.tableNameGreatHump} = (params = {}) => {
    return remove(`/${r"${api}"}/${basicParameter.moduleName}/${tableInfo.tableNameHump}/deleteBatchByIdList`, params)
}