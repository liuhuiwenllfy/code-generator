<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.dto;

import ${basicParameter.packageName}.core.config.mybatisplus.entity.UpdateInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

<#list tableInfo.tableField as field>
    <#if field.isUpdateParam!false>
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
@Schema(name = "${tableInfo.tableNameGreatHump}UpdateDto")
public class ${tableInfo.tableNameGreatHump}UpdateDto extends UpdateInfo{

<#list tableInfo.tableField as field>
    <#if field.isAddParam!false>
    @Schema(description = "${field.columnComment}")
        <#if field.javaType == 'String'>
            <#if field.isRequiredField!false>
    @NotBlank(message = "${field.columnComment}不能为空")
            </#if>
            <#if field.characterMaximumLength != 0>
    @Size(max = ${field.characterMaximumLength}, message = "${field.columnComment}长度在1~${field.characterMaximumLength}之间")
            </#if>
        <#else>
            <#if field.isRequiredField!false>
    @NotNull(message = "${field.columnComment}不能为空")
            </#if>
        </#if>
    private ${field.javaType} ${field.columnNameHump};

    </#if>
</#list>
}
