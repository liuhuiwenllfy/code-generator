package cn.liulingfengyu.codegenerator.controller;

import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionInsertDto;
import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionPageDto;
import cn.liulingfengyu.codegenerator.dto.DatabaseConnectionUpdateDto;
import cn.liulingfengyu.codegenerator.service.IDatabaseConnectionService;
import cn.liulingfengyu.codegenerator.vo.DatabaseConnectionVo;
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
 * 数据库连接 前端控制器
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-12 15:00:33
 */
@RestController
@RequestMapping("/codegenerator/databaseConnection")
@Tag(name = "数据库连接控制器")
@AllArgsConstructor
public class DatabaseConnectionController {

    private final IDatabaseConnectionService service;

    /**
     * 条件分页查询数据库连接
     *
     * @param dto 条件参数
     * @return {@link RespJson}
     */
    @GetMapping("getByPage")
    @Operation(summary = "条件分页查询数据库连接")
    public RespJson<IPage<DatabaseConnectionVo>> getByPage(@ParameterObject DatabaseConnectionPageDto dto) {
        return RespJson.success(service.getByPage(dto));
    }

    /**
     * 查询数据库连接集合
     *
     * @return {@link RespJson}
     */
    @GetMapping("getList")
    @Operation(summary = "查询数据库连接集合")
    public RespJson<List<DatabaseConnectionVo>> getList() {
        return RespJson.success(service.getList());
    }

    /**
     * 根据id查询数据库连接
     *
     * @param id 主键
     * @return {@link RespJson}
     */
    @GetMapping("queryById")
    @Operation(summary = "根据字典id查询数据库连接")
    public RespJson<DatabaseConnectionVo> queryById(@Parameter(description = "主键", required = true) String id) {
        return RespJson.success(service.queryById(id));
    }

    /**
     * 新增数据库连接
     *
     * @param dto 数据库连接新增参数
     * @return {@link RespJson}
     */
    @PostMapping("insert")
    @Operation(summary = "新增数据库连接")
    public RespJson<Boolean> insert(@RequestBody @Validated DatabaseConnectionInsertDto dto) {
        return RespJson.state(service.insertItem(dto));
    }

    /**
     * 修改数据库连接
     *
     * @param dto 数据库连接修改参数
     * @return {@link RespJson}
     */
    @PutMapping("updateById")
    @Operation(summary = "修改数据库连接")
    public RespJson<Boolean> updateById(@RequestBody @Validated DatabaseConnectionUpdateDto dto) {
        return RespJson.state(service.updateItem(dto));
    }

    /**
     * 批量删除数据库连接
     *
     * @param idList ids
     * @return {@link RespJson}
     */
    @DeleteMapping("deleteBatchByIdList")
    @Operation(summary = "批量删除数据库连接")
    public RespJson<Boolean> deleteBatchByIdList(@Parameter(description = "数据库连接id逗号字符串", required = true) @RequestParam List<String> idList) {
        return RespJson.state(service.deleteBatchByIdList(idList));
    }

}
