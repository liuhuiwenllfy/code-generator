package cn.liulingfengyu.codegenerator.emnus;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * UI类型枚举
 *
 * @author 刘凌枫羽工作室
 */
@Getter
@AllArgsConstructor
public enum UiTypeEnum {

    /**
     * INPUT_FIELD-输入框
     * TEXT_FIELD-文本域
     * DIGITAL_INPUT_BOX-数字输入框
     * SELECT_BOX-选择框
     * OPTION_GROUP-单选框组
     * TREE_SELECTION-树形选择
     * DATE_SELECTION_BOX-日期选择框
     * DATE_RANGE_SELECTION_BOX-日期范围选择框
     * LABEL_INPUT_FIELD-标签输入框
     * PROFILE_PICTURE_UPLOAD-头像上传
     * PICTURE_UPLOAD-图片上传
     * MARKDOWN-markdown
     */
    INPUT_FIELD("INPUT_FIELD", "输入框"),
    TEXT_FIELD("TEXT_FIELD", "文本域"),
    DIGITAL_INPUT_BOX("DIGITAL_INPUT_BOX", "数字输入框"),
    SELECT_BOX("SELECT_BOX", "选择框"),
    OPTION_GROUP("OPTION_GROUP", "单选框组"),
    TREE_SELECTION("TREE_SELECTION", "树形选择"),
    DATE_SELECTION_BOX("DATE_SELECTION_BOX", "日期选择框"),
    DATE_RANGE_SELECTION_BOX("DATE_RANGE_SELECTION_BOX", "日期范围选择框"),
    LABEL_INPUT_FIELD("LABEL_INPUT_FIELD", "标签输入框"),
    PROFILE_PICTURE_UPLOAD("PROFILE_PICTURE_UPLOAD", "头像上传"),
    PICTURE_UPLOAD("PICTURE_UPLOAD", "图片上传"),
    MARKDOWN("MARKDOWN", "markdown");

    private final String code;

    private final String message;

    public static String getMessage(String code) {
        for (UiTypeEnum value : UiTypeEnum.values()) {
            if (value.code.equals(code)) {
                return value.message;
            }
        }
        return null;
    }
}
