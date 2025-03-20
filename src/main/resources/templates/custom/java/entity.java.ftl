package ${basicParameter.packageName}.${basicParameter.moduleName}.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

<#list tableInfo.tableField as field>
<#if field.javaType == "Date">
import java.util.Date;
<#break>
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
@Accessors(chain = true)
@TableName("${tableInfo.tableName}")
@Schema(name = "${tableInfo.tableNameGreatHump}", description = "${tableInfo.tableComment!}")
public class ${tableInfo.tableNameGreatHump} extends Model<${tableInfo.tableNameGreatHump}> {

    private static final long serialVersionUID = 1L;

<#list tableInfo.tableField as field>
    <#if field.isPrimaryKey!false>
    @TableId(value = "${field.columnName}", type = IdType.ASSIGN_UUID)
    </#if>
    @Schema(description = "${field.columnComment}")
    <#if field.isAutofill!false>
    @TableField(fill = FieldFill.${field.autofillRule!'INSERT_UPDATE'})
    </#if>
    <#if field.isLogicDelete!false>
    @TableLogic
    </#if>
    <#if field.isVersion!false>
    @Version
    </#if>
    private ${field.javaType} ${field.columnNameHump};

</#list>

    @Override
    public Serializable pkVal() {
        return this.id;
    }
}
