<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

<#list tableInfo.tableField as field>
<#if field.javaType == "Date">
<#if field.isAddParam!false>
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
@Schema(name = "${tableInfo.tableNameGreatHump}InsertDto")
public class ${tableInfo.tableNameGreatHump}InsertDto {

<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
    @Schema(description = "${field.columnComment}")
    <#if field.javaType == 'String'>
    @NotBlank(message = "${field.columnComment}不能为空")
    <#if field.characterMaximumLength != 0>
    @Size(min = 1, max = ${field.characterMaximumLength}, message = "${field.columnComment}长度在1~${field.characterMaximumLength}之间")
    </#if>
    <#else>
    @NotNull(message = "${field.columnComment}不能为空")
    </#if>
    private ${field.javaType} ${field.columnNameHump};

    </#if>
</#list>
}
