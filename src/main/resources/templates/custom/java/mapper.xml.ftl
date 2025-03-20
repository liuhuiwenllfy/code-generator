<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${basicParameter.packageName}.${basicParameter.moduleName}.mapper.${tableInfo.tableNameGreatHump}Mapper">

    <!-- 通用查询映射结果 -->
    <resultMap id="BaseResultMap"
               type="${basicParameter.packageName}.${basicParameter.moduleName}.entity.${tableInfo.tableNameGreatHump}">
        <#list tableInfo.tableField as field>
            <#if field.isPrimaryKey!false>
                <id column="${field.columnName}" property="${field.columnNameHump}"/>
                <#break>
            </#if>
        </#list>
        <#list tableInfo.tableField as field>
            <#if !field.isPrimaryKey!false>
                <result column="${field.columnName}" property="${field.columnNameHump}"/>
            </#if>
        </#list>
    </resultMap>

    <select id="getByPage"
            resultType="${basicParameter.packageName}.${basicParameter.moduleName}.vo.${tableInfo.tableNameGreatHump}Vo">
        select * from ${tableInfo.tableName}
        <where> is_delete = false
            <#list tableInfo.tableField as field>
                <#if field.isCondition!false>
                    <if test="dto.${field.columnNameHump} != null <#if field.javaType == 'String'>and dto.${field.columnNameHump} != ''</#if>">
                        <#if field.isFuzzyQuery!false>
                            and ${field.columnName} like concat('%', ${r"#{"}dto.${field.columnNameHump}${r"}"},'%')
                        <#else>
                            and ${field.columnName} = ${r"#{"}dto.${field.columnNameHump}${r"}"}
                        </#if>
                    </if>
                </#if>
            </#list>
        </where>
    </select>

    <select id="queryById"
            resultType="${basicParameter.packageName}.${basicParameter.moduleName}.vo.${tableInfo.tableNameGreatHump}Vo">
        select *
        from ${tableInfo.tableName}
        <where>
            id = ${r"#{id}"}
        </where>
    </select>

    <#if tableInfo.isGenerateTreeSelect!false>
    <select id="getList" resultType="${basicParameter.packageName}.core.config.mybatisplus.entity.TreeNode">
        select *
        from ${tableInfo.tableName}
        where is_delete = false
    </select>
    </#if>
</mapper>
