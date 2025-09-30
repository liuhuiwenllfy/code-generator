package cn.liulingfengyu.codegenerator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;


/**
 * <p>
 *
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 14:55:17
 */
@Getter
@Setter
@Schema(name = "CodeGeneratorParamsInsertDto")
public class CodeGeneratorParamsInsertDto {

    @Schema(description = "标题")
    private String title;

    @Schema(description = "前端接口片段")
    private String api;

    @Schema(description = "作者")
    private String author;

    @Schema(description = "是否去表前缀")
    private Boolean isRemovePrefix;

    @Schema(description = "后端项目地址")
    private String javaProjectAddress;

    @Schema(description = "模块名")
    private String moduleName;

    @Schema(description = "模块中文名")
    private String moduleCnName;

    @Schema(description = "模块图标")
    private String moduleIcon;

    @Schema(description = "包名")
    private String packageName;

    @Schema(description = "前端项目地址")
    private String vueProjectAddress;

}
