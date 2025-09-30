<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.dto;

import ${basicParameter.packageName}.core.config.mybatisplus.entity.PageInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
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
@Schema(name = "${tableInfo.tableNameGreatHump}PageDto")
public class ${tableInfo.tableNameGreatHump}PageDto extends PageInfo{

<#list tableInfo.tableField as field>
    <#if field.isCondition!false>
        <#if field.uiType == "DATE_RANGE_SELECTION_BOX">
    @Schema(description = "${field.columnComment}开始日期")
    private String ${field.columnNameHump}Stat;

    @Schema(description = "${field.columnComment}结束日期")
    private String ${field.columnNameHump}End;

        <#elseif field.uiType == "DATE_SELECTION_BOX">
    @Schema(description = "${field.columnComment}")
    private String ${field.columnNameHump}Stat;

        <#else>
    @Schema(description = "${field.columnComment}")
    private ${field.javaType} ${field.columnNameHump};

        </#if>
    </#if>
</#list>
}
