<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.service;

<#if tableInfo.isGenerateTreeSelect!false>
import ${basicParameter.packageName}.core.config.mybatisplus.entity.TreeNode;
</#if>
import ${basicParameter.packageName}.${basicParameter.moduleName}.entity.${tableInfo.tableNameGreatHump};
import ${basicParameter.packageName}.${basicParameter.moduleName}.vo.${tableInfo.tableNameGreatHump}Vo;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}PageDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}InsertDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}UpdateDto;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * <p>
 * ${tableInfo.tableComment!} 服务类
 * </p>
 *
 * @author ${basicParameter.author}
 * @since ${date}
 */
public interface I${tableInfo.tableNameGreatHump}Service extends IService<${tableInfo.tableNameGreatHump}> {

    /**
     * 分页查询${tableInfo.tableComment!}
     *
     * @param dto 条件入参
     * @return {@linkplain  IPage}
     */
    IPage<${tableInfo.tableNameGreatHump}Vo> getByPage(${tableInfo.tableNameGreatHump}PageDto dto);

    /**
     * 查询${tableInfo.tableComment!}集合
     *
     * @return {@link List}
     */
    List<${tableInfo.tableNameGreatHump}Vo> getList();

    /**
     * 根据id查询${tableInfo.tableComment!}
     *
     * @param id 主键
     * @return {@link ${tableInfo.tableNameGreatHump}Vo}
     */
    ${tableInfo.tableNameGreatHump}Vo queryById(String id);

<#if tableInfo.isGenerateTreeSelect!false>
    /**
     * ${tableInfo.tableComment!}树结构
     *
     * @return {@link List}
     */
    List<TreeNode> getTree();
</#if>

    /**
     * 新增${tableInfo.tableComment!}
     *
     * @param dto ${tableInfo.tableComment!}新增参数
     * @return boolean
     */
    boolean insertItem(${tableInfo.tableNameGreatHump}InsertDto dto);

    /**
     * 修改${tableInfo.tableComment!}
     *
     * @param dto ${tableInfo.tableComment!}修改参数
     * @return boolean
     */
    boolean updateItem(${tableInfo.tableNameGreatHump}UpdateDto dto);

    /**
     * 批量删除${tableInfo.tableComment!}
     *
     * @param idList ids
     * @return boolean
    */
    boolean deleteBatchByIdList(List<String> idList);

<#if tableInfo.isCache!false>
    /**
     * 初始化缓存
     */
    void initCache();
</#if>
}
