package ${basicParameter.packageName}.${basicParameter.moduleName}.vo;

import cn.liulingfengyu.core.config.mybatisplus.entity.BaseInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;

<#list tableInfo.tableField as field>
<#if field.javaType == "Date">
<#if field.isShow!false>
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
    @Schema(description = "${field.columnComment}")
    private ${field.javaType} ${field.columnNameHump};

    </#if>
</#list>
}
