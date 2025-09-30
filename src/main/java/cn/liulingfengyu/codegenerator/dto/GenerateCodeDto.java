package cn.liulingfengyu.codegenerator.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotEmpty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class GenerateCodeDto extends TableInfoDto {

    @Schema(description = "是否开启覆盖", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean isCover;

    @Schema(description = "是否生成java代码", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean isGenerateJava;

    @Schema(description = "是否生成vue代码", requiredMode = Schema.RequiredMode.REQUIRED)
    private Boolean isGenerateVue;

    @Schema(description = "表和字段信息", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotEmpty(message = "表和字段信息不能为空")
    @Valid
    List<TableAndFieldDto> tableAndFieldDtoList;
}
