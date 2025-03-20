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
     * 1-输入框
     * 2-文本域
     * 3-数字输入框
     * 4-选择框
     * 5-单选框组
     * 6-多选框组
     * 7-树形选择
     * 8-日期选择框
     * 9-日期范围选择框
     * 10-标签输入框
     * 11-头像上传
     * 12-图片上传
     * 13-批量图片上传
     * 14-批量文件上传
     */
    INPUT_FIELD("INPUT_FIELD", "输入框"),
    TEXT_FIELD("TEXT_FIELD", "文本域"),
    DIGITAL_INPUT_BOX("DIGITAL_INPUT_BOX", "数字输入框"),
    SELECT_BOX("SELECT_BOX", "选择框"),
    OPTION_GROUP("OPTION_GROUP", "单选框组"),
    MULTIPLE_CHECK_BOX_GROUP("MULTIPLE_CHECK_BOX_GROUP", "多选框组"),
    TREE_SELECTION("TREE_SELECTION", "树形选择"),
    DATE_SELECTION_BOX("DATE_SELECTION_BOX", "日期选择框"),
    DATE_RANGE_SELECTION_BOX("DATE_RANGE_SELECTION_BOX", "日期范围选择框"),
    LABEL_INPUT_FIELD("LABEL_INPUT_FIELD", "标签输入框"),
    PROFILE_PICTURE_UPLOAD("PROFILE_PICTURE_UPLOAD", "头像上传"),
    PICTURE_UPLOAD("PICTURE_UPLOAD", "图片上传"),
    BATCH_IMAGE_UPLOAD("BATCH_IMAGE_UPLOAD", "批量图片上传"),
    BATCH_FILE_UPLOAD("BATCH_FILE_UPLOAD", "批量文件上传");

    private final String code;

    private final String message;

    public static String getMessage(String code) {
        switch (code) {
            case "INPUT_FIELD":
                return INPUT_FIELD.message;
            case "TEXT_FIELD":
                return TEXT_FIELD.message;
            case "DIGITAL_INPUT_BOX":
                return DIGITAL_INPUT_BOX.message;
            case "SELECT_BOX":
                return SELECT_BOX.message;
            case "OPTION_GROUP":
                return OPTION_GROUP.message;
            case "TREE_SELECTION":
                return TREE_SELECTION.message;
            case "DATE_SELECTION_BOX":
                return DATE_SELECTION_BOX.message;
            case "DATE_RANGE_SELECTION_BOX":
                return DATE_RANGE_SELECTION_BOX.message;
            default:
                return null;
        }
    }
}
