<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.dto;

import ${basicParameter.packageName}.core.config.mybatisplus.entity.PageInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

<#list tableInfo.tableField as field>
<#if field.javaType == "Date">
<#if field.isCondition!false>
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
    @Schema(description = "${field.columnComment}")
    private ${field.javaType} ${field.columnNameHump};

    </#if>
</#list>
}
