package ${basicParameter.packageName}.${basicParameter.moduleName}.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import ${basicParameter.packageName}.${basicParameter.moduleName}.service.I${tableInfo.tableNameGreatHump}Service;
import ${basicParameter.packageName}.${basicParameter.moduleName}.vo.${tableInfo.tableNameGreatHump}Vo;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}PageDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}InsertDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}UpdateDto;
import ${basicParameter.packageName}.utils.RespJson;
<#if tableInfo.isGenerateTreeSelect!false>
import ${basicParameter.packageName}.core.config.mybatisplus.entity.TreeNode;
</#if>
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <p>
 * ${tableInfo.tableComment!} 前端控制器
 * </p>
 *
 * @author ${basicParameter.author}
 * @since ${date}
 */
@RestController
@RequestMapping("/${basicParameter.moduleName}/${tableInfo.tableNameHump}")
@Tag(name = "${tableInfo.tableComment!}控制器")
@AllArgsConstructor
public class ${tableInfo.tableNameGreatHump}Controller {

    private final I${tableInfo.tableNameGreatHump}Service service;

    /**
     * 条件分页查询${tableInfo.tableComment!}
     *
     * @param dto 条件参数
     * @return {@link RespJson}
     */
    @GetMapping("getByPage")
    @Operation(summary = "条件分页查询${tableInfo.tableComment!}")
    public RespJson<IPage<${tableInfo.tableNameGreatHump}Vo>> getByPage(@ParameterObject ${tableInfo.tableNameGreatHump}PageDto dto) {
        return RespJson.success(service.getByPage(dto));
    }

    /**
     * 根据id查询${tableInfo.tableComment!}
     *
     * @param id 主键
     * @return {@link RespJson}
     */
    @GetMapping("queryById")
    @Operation(summary = "根据字典id查询${tableInfo.tableComment!}")
    public RespJson<${tableInfo.tableNameGreatHump}Vo> queryById(@Parameter(description = "主键", required = true) String id) {
        return RespJson.success(service.queryById(id));
    }

    <#if tableInfo.isGenerateTreeSelect!false>
    /**
     * ${tableInfo.tableComment!}树结构
     *
     * @return {@link RespJson}
     */
    @GetMapping("getTree")
    @Operation(summary = "${tableInfo.tableComment!}树结构")
    public RespJson<List<TreeNode>> getTree() {
       return RespJson.success(service.getTree());
    }
    </#if>

    /**
     * 新增${tableInfo.tableComment!}
     *
     * @param dto ${tableInfo.tableComment!}新增参数
     * @return {@link RespJson}
     */
    @PostMapping("insert")
    @Operation(summary = "新增${tableInfo.tableComment!}")
    public RespJson<Boolean> insert(@RequestBody @Validated ${tableInfo.tableNameGreatHump}InsertDto dto) {
        return RespJson.insertState(service.insertItem(dto));
    }

    /**
     * 修改${tableInfo.tableComment!}
     *
     * @param dto ${tableInfo.tableComment!}修改参数
     * @return {@link RespJson}
     */
    @PutMapping("updateById")
    @Operation(summary = "修改${tableInfo.tableComment!}")
    public RespJson<Boolean> updateById(@RequestBody @Validated ${tableInfo.tableNameGreatHump}UpdateDto dto) {
        return RespJson.updateState(service.updateItem(dto));
    }

    /**
     * 批量删除${tableInfo.tableComment!}
     *
     * @param idList ids
     * @return {@link RespJson}
     */
    @DeleteMapping("deleteBatchByIdList")
    @Operation(summary = "批量删除${tableInfo.tableComment!}")
    public RespJson<Boolean> deleteBatchByIdList(@Parameter(description = "${tableInfo.tableComment!}id逗号字符串", required = true) @RequestParam List<String> idList) {
        return RespJson.deleteState(service.deleteBatchByIdList(idList));
    }
}
