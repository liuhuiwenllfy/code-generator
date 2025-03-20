package cn.liulingfengyu.codegenerator.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

/**
 * Ui类型
 * @author 刘凌枫羽工作室
 */
@Getter
@Setter
public class UiTypeVo {

    @Schema(description = "Ui类型key")
    private String key;

    @Schema(description = "Ui类型value")
    private String value;

}
