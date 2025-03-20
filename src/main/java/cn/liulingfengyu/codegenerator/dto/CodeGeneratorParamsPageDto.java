package cn.liulingfengyu.codegenerator.dto;

import cn.liulingfengyu.core.config.mybatisplus.entity.PageInfo;
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
@Schema(name = "CodeGeneratorParamsPageDto")
public class CodeGeneratorParamsPageDto extends PageInfo {

    @Schema(description = "标题")
    private String title;
}
