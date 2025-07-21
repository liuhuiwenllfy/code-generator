package cn.liulingfengyu.codegenerator.controller;

import cn.liulingfengyu.codegenerator.dto.TableInfoInsertDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoPageDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoUpdateDto;
import cn.liulingfengyu.codegenerator.service.ITableInfoService;
import cn.liulingfengyu.codegenerator.vo.TableInfoVo;
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
 * 代码生成属性信息前端控制器
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:03:38
 */
@RestController
@RequestMapping("/codegenerator/tableInfo")
@Tag(name = "代码生成属性信息控制器")
@AllArgsConstructor
public class TableInfoController {

    private final ITableInfoService service;

    /**
     * 条件分页查询代码生成属性信息
     *
     * @param dto 条件参数
     * @return {@link RespJson}
     */
    @GetMapping("getByPage")
    @Operation(summary = "条件分页查询代码生成属性信息")
    public RespJson<IPage<TableInfoVo>> getByPage(@ParameterObject TableInfoPageDto dto) {
        return RespJson.success(service.getByPage(dto));
    }

    /**
     * 根据id查询代码生成属性信息
     *
     * @param id 主键
     * @return {@link RespJson}
     */
    @GetMapping("queryById")
    @Operation(summary = "根据字典id查询代码生成属性信息")
    public RespJson<TableInfoVo> queryById(@Parameter(description = "主键", required = true) String id) {
        return RespJson.success(service.queryById(id));
    }

    /**
     * 新增代码生成属性信息
     *
     * @param dto 新增参数
     * @return {@link RespJson}
     */
    @PostMapping("insert")
    @Operation(summary = "新增代码生成属性信息")
    public RespJson<Boolean> insert(@RequestBody @Validated TableInfoInsertDto dto) {
        return RespJson.insertState(service.insertItem(dto));
    }

    /**
     * 修改代码生成属性信息
     *
     * @param dto 修改参数
     * @return {@link RespJson}
     */
    @PutMapping("updateById")
    @Operation(summary = "修改代码生成属性信息")
    public RespJson<Boolean> updateById(@RequestBody @Validated TableInfoUpdateDto dto) {
        return RespJson.updateState(service.updateItem(dto));
    }

    /**
     * 批量删除代码生成属性信息
     *
     * @param idList ids
     * @return {@link RespJson}
     */
    @DeleteMapping("deleteBatchByIdList")
    @Operation(summary = "批量删除代码生成属性信息")
    public RespJson<Boolean> deleteBatchByIdList(@Parameter(description = "id逗号字符串", required = true) @RequestParam List<String> idList) {
        return RespJson.deleteState(service.deleteBatchByIdList(idList));
    }
}
