package cn.liulingfengyu.core.config.mybatisplus.entity;


import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

/**
 * 分页通用父类
 *
 * @author 刘凌枫羽工作室
 */
@Data
@Schema(name = "PageInfo")
public class PageInfo {

    @Schema(description = "页码", requiredMode = Schema.RequiredMode.REQUIRED, allowableValues = {"1", "2", "3"})
    private Integer page;

    @Schema(description = "页大小", requiredMode = Schema.RequiredMode.REQUIRED, allowableValues = {"10", "20", "50"})
    private Integer pageSize;

    @Schema(description = "正序排序字段逗号拼接字符串（对应数据库字段）")
    private String ascs;

    @Schema(description = "倒序排序字段逗号拼接字符串（对应数据库字段）")
    private String descs;
}
