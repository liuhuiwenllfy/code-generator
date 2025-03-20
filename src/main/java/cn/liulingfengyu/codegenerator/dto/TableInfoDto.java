package cn.liulingfengyu.codegenerator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.util.List;

/**
 * 代码生成所需参数对象
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
@Schema(name = "TableInfoDto")
public class TableInfoDto {

    @Schema(description = "数据库连接", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库连接不能为空")
    private String databaseConnectionId;

    @Schema(description = "代码生成参数模板", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "代码生成参数模板不能为空")
    private String codeGeneratorParamsId;

    @Schema(description = "数据库名称", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotBlank(message = "数据库名称不能为空")
    private String databaseName;

    @Schema(description = "数据库表集合", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "数据库表集合不能为空")
    private List<String> databaseTableList;


}
