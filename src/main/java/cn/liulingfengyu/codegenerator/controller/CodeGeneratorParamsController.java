package cn.liulingfengyu.codegenerator.controller;

import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsInsertDto;
import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsPageDto;
import cn.liulingfengyu.codegenerator.dto.CodeGeneratorParamsUpdateDto;
import cn.liulingfengyu.codegenerator.service.ICodeGeneratorParamsService;
import cn.liulingfengyu.codegenerator.vo.CodeGeneratorParamsVo;
import cn.liulingfengyu.utils.RespJson;
import com.baomidou.mybatisplus.core.metadata.IPage;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * <p>
 * 代码生成参数前端控制器
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 14:55:17
 */
@RestController
@RequestMapping("/codegenerator/codeGeneratorParams")
@Tag(name = "代码生成参数控制器")
@AllArgsConstructor
public class CodeGeneratorParamsController {

    private final ICodeGeneratorParamsService service;

    /**
     * 代码生成参数条件分页查询
     *
     * @param dto 条件参数
     * @return {@link RespJson}
     */
    @GetMapping("getByPage")
    @Operation(summary = "代码生成参数条件分页查询")
    public RespJson<IPage<CodeGeneratorParamsVo>> getByPage(@ParameterObject CodeGeneratorParamsPageDto dto) {
        return RespJson.success(service.getByPage(dto));
    }

    /**
     * 查询代码生成参数集合
     *
     * @return {@link RespJson}
     */
    @GetMapping("getList")
    @Operation(summary = "查询代码生成参数集合")
    public RespJson<List<CodeGeneratorParamsVo>> getList() {
        return RespJson.success(service.getList());
    }

    /**
     * 代码生成参数根据id查询
     *
     * @param id 主键
     * @return {@link RespJson}
     */
    @GetMapping("queryById")
    @Operation(summary = "代码生成参数根据字典id查询")
    public RespJson<CodeGeneratorParamsVo> queryById(@Parameter(description = "主键", required = true) String id) {
        return RespJson.success(service.queryById(id));
    }

    /**
     * 新增代码生成参数
     *
     * @param dto 新增参数
     * @return {@link RespJson}
     */
    @PostMapping("insert")
    @Operation(summary = "新增代码生成参数")
    public RespJson<Boolean> insert(@RequestBody @Validated CodeGeneratorParamsInsertDto dto) {
        return RespJson.insertState(service.insertItem(dto));
    }

    /**
     * 修改代码生成参数
     *
     * @param dto 修改参数
     * @return {@link RespJson}
     */
    @PutMapping("updateById")
    @Operation(summary = "修改代码生成参数")
    public RespJson<Boolean> updateById(@RequestBody @Validated CodeGeneratorParamsUpdateDto dto) {
        return RespJson.insertState(service.updateItem(dto));
    }

    /**
     * 批量删除代码生成参数
     *
     * @param idList ids
     * @return {@link RespJson}
     */
    @DeleteMapping("deleteBatchByIdList")
    @Operation(summary = "批量删除代码生成参数")
    public RespJson<Boolean> deleteBatchByIdList(@Parameter(description = "id逗号字符串", required = true) @RequestParam List<String> idList) {
        return RespJson.insertState(service.deleteBatchByIdList(idList));
    }

}
