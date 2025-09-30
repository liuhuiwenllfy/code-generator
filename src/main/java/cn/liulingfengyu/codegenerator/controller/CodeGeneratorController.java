package cn.liulingfengyu.codegenerator.controller;

import cn.liulingfengyu.codegenerator.dto.GenerateCodeDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoDto;
import cn.liulingfengyu.codegenerator.service.ICodeGeneratorService;
import cn.liulingfengyu.codegenerator.vo.TableAndFieldVo;
import cn.liulingfengyu.codegenerator.vo.TableIdAndCommentVo;
import cn.liulingfengyu.codegenerator.vo.UiTypeVo;
import cn.liulingfengyu.utils.RespJson;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 代码生成器控制器
 *
 * @author 刘凌枫羽工作室
 */
@RestController
@RequestMapping("/codegenerator/codeGenerator")
@AllArgsConstructor
@Tag(name = "代码生成器控制器")
public class CodeGeneratorController {

    private final ICodeGeneratorService service;

    /**
     * 获取数据库列表
     *
     * @param databaseConnectionId 数据库连接id
     * @return {@link RespJson}
     */
    @GetMapping("/getDatabaseList")
    @Operation(summary = "获取数据库列表")
    public RespJson<List<String>> getDatabaseList(@Parameter(description = "数据库连接id", required = true) String databaseConnectionId) {
        return RespJson.success(service.getDatabaseList(databaseConnectionId));
    }

    /**
     * 获取数据库表列表
     *
     * @param databaseConnectionId 数据库连接id
     * @return {@link RespJson}
     */
    @GetMapping("/getDatabaseTableList")
    @Operation(summary = "获取数据库表列表")
    public RespJson<List<TableIdAndCommentVo>> getDatabaseTableList(@Parameter(description = "数据库连接id", required = true) String databaseConnectionId,
                                                                    @Parameter(description = "数据库名称", required = true) String databaseName) {
        return RespJson.success(service.getDatabaseTableList(databaseConnectionId, databaseName));
    }

    /**
     * 获取表和字段信息
     *
     * @param tableInfoDto 入参
     * @return {@link RespJson}
     */
    @PostMapping("/getTableAndField")
    @Operation(summary = "获取表和字段信息")
    public RespJson<List<TableAndFieldVo>> getTableAndField(@Validated @RequestBody TableInfoDto tableInfoDto) {
        return RespJson.success(service.getTableAndField(tableInfoDto));
    }

    /**
     * 生成代码
     *
     * @param generateCodeDto 入参
     * @return {@link RespJson}
     */
    @PostMapping("/generateCode")
    @Operation(summary = "生成代码")
    public RespJson<Boolean> generateCode(@Validated @RequestBody GenerateCodeDto generateCodeDto) {
        return RespJson.state(service.generateCode(generateCodeDto));
    }

    /**
     * 获取UI类型
     *
     * @return {@link RespJson}
     */
    @GetMapping("/getUiTypeList")
    @Operation(summary = "获取数据库列表")
    public RespJson<List<UiTypeVo>> getUiTypeList() {
        return RespJson.success(service.getUiTypeList());
    }
}
