package ${basicParameter.packageName}.${basicParameter.moduleName}.mapper;

<#if tableInfo.isGenerateTreeSelect!false>
import ${basicParameter.packageName}.core.config.mybatisplus.entity.TreeNode;
</#if>
import ${basicParameter.packageName}.${basicParameter.moduleName}.entity.${tableInfo.tableNameGreatHump};
import ${basicParameter.packageName}.${basicParameter.moduleName}.vo.${tableInfo.tableNameGreatHump}Vo;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}PageDto;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * <p>
 * ${tableInfo.tableComment!} Mapper 接口
 * </p>
 *
 * @author ${basicParameter.author}
 * @since ${date}
 */
public interface ${tableInfo.tableNameGreatHump}Mapper extends BaseMapper<${tableInfo.tableNameGreatHump}> {

    /**
     * 分页查询${tableInfo.tableComment!}
     *
     * @param page 分页对象
     * @param dto 条件入参
     * @return {@link List}
     */
    List<${tableInfo.tableNameGreatHump}Vo> getByPage(Page<${tableInfo.tableNameGreatHump}Vo> page, ${tableInfo.tableNameGreatHump}PageDto dto);

    /**
     * 根据id查询${tableInfo.tableComment!}
     *
     * @param id 主键
     * @return {@link ${tableInfo.tableNameGreatHump}Vo}
     */
    ${tableInfo.tableNameGreatHump}Vo queryById(String id);

    <#if tableInfo.isGenerateTreeSelect!false>
    /**
     * 获取${tableInfo.tableComment!}
     *
     * @return {@link List}
     */
    List<TreeNode> getList();
    </#if>
}
