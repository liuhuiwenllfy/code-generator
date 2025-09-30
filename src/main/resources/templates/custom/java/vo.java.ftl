<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.vo;

import cn.liulingfengyu.core.config.mybatisplus.entity.BaseInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

<#list tableInfo.tableField as field>
    <#if field.isShow!false>
        <#if field.javaType == "Date">
import java.util.Date;
        <#break>
        </#if>
    </#if>
</#list>

/**
 * <p>
 * ${tableInfo.tableComment!}
 * </p>
 *
 * @author ${basicParameter.author}
 * @since ${date}
 */
@Getter
@Setter
@Schema(name = "${tableInfo.tableNameGreatHump}Vo")
public class ${tableInfo.tableNameGreatHump}Vo extends BaseInfo{

<#list tableInfo.tableField as field>
    <#if field.isShow!false>
        <#if field.columnNameHump != 'id' && field.columnNameHump != 'createUser' && field.columnNameHump != 'createTime' && field.columnNameHump != 'version'>
    @Schema(description = "${field.columnComment}")
    private ${field.javaType} ${field.columnNameHump};

        </#if>
    <#elseif field.isShowDetails!false>
        <#if field.columnNameHump != 'id' && field.columnNameHump != 'createUser' && field.columnNameHump != 'createTime' && field.columnNameHump != 'version'>
    @Schema(description = "${field.columnComment}")
    private ${field.javaType} ${field.columnNameHump};

        </#if>
    </#if>
</#list>
<#list tableInfo.tableField as field>
    <#if field.isShow!false>
        <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>
    @Schema(description = "${field.columnComment}名称")
    private String ${field.columnNameHump}Name;

        </#if>
    </#if>
</#list>
}
