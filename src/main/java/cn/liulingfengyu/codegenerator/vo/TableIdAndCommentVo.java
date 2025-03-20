package cn.liulingfengyu.codegenerator.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;


/**
 * <p>
 *
 * </p>
 *
 * @author 刘凌枫羽工作室
 * @since 2024-10-17 16:03:38
 */
@Getter
@Setter
@Schema(name = "TableInfoVo")
public class TableIdAndCommentVo {

    @Schema(description = "表名称")
    private String tableName;

    @Schema(description = "表注释")
    private String tableComment;
}
