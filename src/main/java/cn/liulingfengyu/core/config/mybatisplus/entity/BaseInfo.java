package cn.liulingfengyu.core.config.mybatisplus.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/**
 * 查询通用父类
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
@Data
public class BaseInfo {

    @Schema(description = "主键")
    private String id;

    @Schema(description = "创建人")
    private String createUser;

    @Schema(description = "创建时间")
    private String createTime;

    @Schema(description = "乐观锁")
    private Integer version;
}
