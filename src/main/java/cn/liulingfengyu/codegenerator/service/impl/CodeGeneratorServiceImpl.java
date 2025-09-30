package cn.liulingfengyu.codegenerator.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import cn.liulingfengyu.codegenerator.bo.TableInfoBo;
import cn.liulingfengyu.codegenerator.convert.TableNameConvert;
import cn.liulingfengyu.codegenerator.dto.GenerateCodeDto;
import cn.liulingfengyu.codegenerator.dto.TableAndFieldDto;
import cn.liulingfengyu.codegenerator.dto.TableInfoDto;
import cn.liulingfengyu.codegenerator.emnus.UiTypeEnum;
import cn.liulingfengyu.codegenerator.entity.CodeGeneratorParams;
import cn.liulingfengyu.codegenerator.entity.DatabaseConnection;
import cn.liulingfengyu.codegenerator.entity.TableInfo;
import cn.liulingfengyu.codegenerator.mapper.CodeGeneratorParamsMapper;
import cn.liulingfengyu.codegenerator.mapper.DatabaseConnectionMapper;
import cn.liulingfengyu.codegenerator.service.ICodeGeneratorService;
import cn.liulingfengyu.codegenerator.service.ITableInfoService;
import cn.liulingfengyu.codegenerator.vo.TableAndFieldVo;
import cn.liulingfengyu.codegenerator.vo.TableIdAndCommentVo;
import cn.liulingfengyu.codegenerator.vo.UiTypeVo;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import jakarta.annotation.Resource;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.stream.Collectors;

/**
 * @author 刘凌枫羽工作室
 */
@Service
@Slf4j
public class CodeGeneratorServiceImpl implements ICodeGeneratorService {

    @Resource
    private DatabaseConnectionMapper databaseConnectionMapper;

    @Resource
    private CodeGeneratorParamsMapper codeGeneratorParamsMapper;

    @Autowired
    private ITableInfoService tableInfoService;

    @Autowired
    private Configuration freeMarkerConfiguration;

    private static void writeDocument(File file, Template entityTemplate, Map<String, Object> root, Boolean isCover) throws IOException, TemplateException {
        if (!file.getParentFile().exists()) {
            if (!file.getParentFile().mkdirs()) {
                log.error("无法创建目录: {}", file.getParentFile().getAbsolutePath());
            }
        }
        if (isCover || !file.exists()) {
            Writer fileWriter = new FileWriter(file);
            entityTemplate.process(root, fileWriter);
            fileWriter.flush();
            fileWriter.close();
        } else {
            log.warn("文件已存在，跳过: {}", file.getAbsolutePath());
        }
    }

    @Override
    public List<String> getDatabaseList(String databaseConnectionId) {
        List<String> databaseList = new ArrayList<>();
        DatabaseConnection databaseConnection = databaseConnectionMapper.selectById(databaseConnectionId);
        try (Connection conn = DriverManager.getConnection(databaseConnection.getUrl(), databaseConnection.getUsername(), databaseConnection.getPassword());
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery("SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN('mysql','information_schema','performance_schema','sys')")) {
            while (resultSet.next()) {
                String databaseName = resultSet.getString("schema_name");
                databaseList.add(databaseName);
            }
        } catch (SQLException e) {
            log.error(e.getMessage());
        }
        return databaseList;
    }

    @Override
    public List<TableIdAndCommentVo> getDatabaseTableList(String databaseConnectionId, String databaseName) {
        List<TableIdAndCommentVo> tableIdAndCommentVoList = new ArrayList<>();
        DatabaseConnection databaseConnection = databaseConnectionMapper.selectById(databaseConnectionId);
        try (Connection conn = DriverManager.getConnection(databaseConnection.getUrl(), databaseConnection.getUsername(), databaseConnection.getPassword());
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery("SELECT TABLE_NAME, TABLE_COMMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '" + databaseName + "'")) {
            while (resultSet.next()) {
                TableIdAndCommentVo tableIdAndCommentVo = new TableIdAndCommentVo();
                tableIdAndCommentVo.setTableName(resultSet.getString("TABLE_NAME"));
                tableIdAndCommentVo.setTableComment(resultSet.getString("TABLE_COMMENT"));
                tableIdAndCommentVoList.add(tableIdAndCommentVo);
            }
        } catch (SQLException e) {
            log.error(e.getMessage());
        }
        return tableIdAndCommentVoList;
    }

    @Override
    public List<TableAndFieldVo> getTableAndField(TableInfoDto tableInfoDto) {

        DatabaseConnection databaseConnection = databaseConnectionMapper.selectById(tableInfoDto.getDatabaseConnectionId());

        List<TableAndFieldVo> tableInfoList = new ArrayList<>();

        Map<String, TableInfo> tableInfoMap = tableInfoService.list(new LambdaQueryWrapper<TableInfo>()
                .eq(TableInfo::getDatabaseConnectionId, tableInfoDto.getDatabaseConnectionId())
                .eq(TableInfo::getDatabaseName, tableInfoDto.getDatabaseName())
                .in(TableInfo::getTableName, tableInfoDto.getDatabaseTableList())).stream().collect(Collectors.toMap(tableInfo -> tableInfo.getTableName().concat(tableInfo.getColumnName()), tableInfo -> tableInfo));

        try (Connection conn = DriverManager.getConnection(databaseConnection.getUrl(), databaseConnection.getUsername(), databaseConnection.getPassword());
             Statement stmt = conn.createStatement()) {

            String dataBase = tableInfoDto.getDatabaseName();

            for (String tableName : tableInfoDto.getDatabaseTableList()) {

                String tablesSql = "SELECT TABLE_NAME, TABLE_COMMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '" + dataBase + "' and TABLE_NAME = '" + tableName + "'";

                String columnsSql = "SELECT COLUMN_NAME, DATA_TYPE, COLUMN_COMMENT, COLUMN_KEY, COLUMN_TYPE, CHARACTER_MAXIMUM_LENGTH FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = '" + dataBase + "' AND TABLE_NAME = '" + tableName + "' order by ORDINAL_POSITION";

                String tableComment = null;

                try (ResultSet tablesRs = stmt.executeQuery(tablesSql)) {
                    while (tablesRs.next()) {
                        tableComment = tablesRs.getString("TABLE_COMMENT").replace("\r\n", "");
                    }
                }

                try (ResultSet columnsRs = stmt.executeQuery(columnsSql)) {
                    while (columnsRs.next()) {
                        TableAndFieldVo tableInfo = new TableAndFieldVo();
                        tableInfo.setDatabaseConnectionId(tableInfoDto.getDatabaseConnectionId());
                        tableInfo.setDatabaseName(dataBase);
                        tableInfo.setTableName(tableName);
                        tableInfo.setTableComment(tableComment);
                        tableInfo.setColumnName(columnsRs.getString("COLUMN_NAME"));
                        tableInfo.setColumnType(columnsRs.getString("COLUMN_TYPE"));
                        tableInfo.setCharacterMaximumLength(columnsRs.getInt("CHARACTER_MAXIMUM_LENGTH"));
                        tableInfo.setDataType(columnsRs.getString("DATA_TYPE"));
                        setDataType(tableInfo);
                        tableInfo.setColumnComment(columnsRs.getString("COLUMN_COMMENT").replace("\r\n", ""));
                        tableInfo.setIsPrimaryKey(columnsRs.getString("COLUMN_KEY").equals("PRI"));
                        tableInfo.setIsLogicDelete(columnsRs.getString("COLUMN_NAME").equals("is_delete"));
                        tableInfo.setIsVersion(columnsRs.getString("COLUMN_NAME").equals("version"));
                        setAutofillColumn(tableInfo);
                        String tableAndColumnName = tableName.concat(columnsRs.getString("COLUMN_NAME"));
                        if (tableInfoMap.containsKey(tableAndColumnName)) {
                            BeanUtils.copyProperties(tableInfoMap.get(tableAndColumnName), tableInfo);
                            if (tableInfo.getIsGenerateTreeSelect() == null) {
                                tableInfo.setIsGenerateTreeSelect(false);
                            }
                            if (tableInfo.getIsCache() == null) {
                                tableInfo.setIsCache(false);
                            }
                        }
                        tableInfoList.add(tableInfo);
                    }
                }
            }
            return tableInfoList;
        } catch (SQLException e) {
            log.error(e.getMessage());
        }
        return Collections.emptyList();
    }

    private void setDataType(TableAndFieldVo tableAndFieldVo) {
        switch (tableAndFieldVo.getDataType()) {
            case "char":
            case "varchar":
            case "text":
            case "tinytext":
            case "mediumtext":
            case "longtext":
                tableAndFieldVo.setJavaType("String");
                tableAndFieldVo.setTsType("string");
                break;
            case "int":
            case "smallint":
            case "mediumint":
            case "tinyint":
                tableAndFieldVo.setJavaType("Integer");
                tableAndFieldVo.setTsType("number");
                if ("tinyint(1)".equals(tableAndFieldVo.getColumnType())) {
                    tableAndFieldVo.setJavaType("Boolean");
                    tableAndFieldVo.setTsType("boolean");
                }
                break;
            case "date":
            case "datetime":
                tableAndFieldVo.setJavaType("Date");
                tableAndFieldVo.setTsType("Date");
                break;
            case "timestamp":
                tableAndFieldVo.setJavaType("Timestamp");
                tableAndFieldVo.setTsType("string");
                break;
            case "decimal":
            case "numeric":
                tableAndFieldVo.setJavaType("BigDecimal");
                tableAndFieldVo.setTsType("number");
                break;
            case "float":
                tableAndFieldVo.setJavaType("Float");
                tableAndFieldVo.setTsType("number");
                break;
            case "double":
                tableAndFieldVo.setJavaType("Double");
                tableAndFieldVo.setTsType("number");
                break;
            default:
                log.info("不需要处理跳过");
        }
    }

    private void setAutofillColumn(TableAndFieldVo tableInfo) {
        switch (tableInfo.getColumnName()) {
            case "create_time":
            case "create_user":
                tableInfo.setIsAutofill(true);
                tableInfo.setAutofillRule("INSERT");
                break;
            case "update_time":
            case "update_user":
                tableInfo.setIsAutofill(true);
                tableInfo.setAutofillRule("INSERT_UPDATE");
                break;
            case "delete_time":
            case "delete_user":
                tableInfo.setIsAutofill(true);
                tableInfo.setAutofillRule("UPDATE");
                break;
            default:
                log.info("不需要处理跳过");
        }
    }

    @Override
    public boolean generateCode(GenerateCodeDto generateCodeDto) {

        CodeGeneratorParams codeGeneratorParams = codeGeneratorParamsMapper.selectById(generateCodeDto.getCodeGeneratorParamsId());

        try {
            Map<String, String> tableNameHumpMap = new HashMap<>();
            for (TableAndFieldDto tableAndFieldDto : generateCodeDto.getTableAndFieldDtoList()) {
                TableInfoBo tableInfoBo = new TableInfoBo();
                tableInfoBo.setIsGenerateTreeSelect(tableAndFieldDto.getIsGenerateTreeSelect());
                tableInfoBo.setIsCache(tableAndFieldDto.getIsCache());
                tableInfoBo.setCacheKeyHump(StrUtil.toCamelCase(tableAndFieldDto.getCacheKey()));
                tableInfoBo.setCacheValueHump(StrUtil.toCamelCase(tableAndFieldDto.getCacheValue()));
                tableInfoBo.setCacheKeyBigHump(StringUtils.capitalize(StrUtil.toCamelCase(tableAndFieldDto.getCacheKey())));
                tableInfoBo.setCacheValueBigHump(StringUtils.capitalize(StrUtil.toCamelCase(tableAndFieldDto.getCacheValue())));
                tableInfoBo.setDatabaseName(tableAndFieldDto.getDatabaseName());
                tableInfoBo.setTableName(tableAndFieldDto.getTableName());
                tableInfoBo.setTableNameGreatHump(TableNameConvert.convertGreatHumpDelPrefix(tableAndFieldDto.getTableName(), codeGeneratorParams.getIsRemovePrefix() != null && codeGeneratorParams.getIsRemovePrefix()));
                tableInfoBo.setTableNameHump(TableNameConvert.convertHumpDelPrefix(tableAndFieldDto.getTableName(), codeGeneratorParams.getIsRemovePrefix() != null && codeGeneratorParams.getIsRemovePrefix()));
                tableInfoBo.setTableComment(tableAndFieldDto.getTableComment());
                List<TableInfoBo.TableField> tableFieldList = new ArrayList<>();
                generateCodeDto.getTableAndFieldDtoList().stream().filter(item -> item.getTableName().equals(tableAndFieldDto.getTableName())).forEach(item -> {
                    TableInfoBo.TableField tableField = new TableInfoBo.TableField();
                    BeanUtils.copyProperties(item, tableField);
                    tableField.setColumnNameHump(StrUtil.toCamelCase(item.getColumnName()));
                    tableField.setColumnNameBigHump(StringUtils.capitalize(StrUtil.toCamelCase(item.getColumnName())));
                    if (StrUtil.isNotBlank(item.getAssociatedTable())) {
                        tableField.setAssociatedTableHump(TableNameConvert.convertHumpDelPrefix(item.getAssociatedTable(), codeGeneratorParams.getIsRemovePrefix() != null && codeGeneratorParams.getIsRemovePrefix()));
                        tableField.setAssociatedTableBigHump(TableNameConvert.convertGreatHumpDelPrefix(item.getAssociatedTable(), codeGeneratorParams.getIsRemovePrefix() != null && codeGeneratorParams.getIsRemovePrefix()));
                        tableField.setDropdownKeyHump(StrUtil.toCamelCase(item.getDropdownKey()));
                        tableField.setDropdownValueHump(StrUtil.toCamelCase(item.getDropdownValue()));
                        tableField.setDropdownKeyBigHump(StringUtils.capitalize(StrUtil.toCamelCase(item.getDropdownKey())));
                        tableField.setDropdownValueBigHump(StringUtils.capitalize(StrUtil.toCamelCase(item.getDropdownValue())));
                    }
                    tableFieldList.add(tableField);
                });
                tableInfoBo.setTableField(tableFieldList);
                Map<String, Object> root = new HashMap<>(3);
                root.put("basicParameter", codeGeneratorParams);
                root.put("tableInfo", tableInfoBo);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                root.put("date", sdf.format(new Date()));

                if (generateCodeDto.getIsGenerateJava()) {
                    generateJava(generateCodeDto, codeGeneratorParams, tableInfoBo, root);
                }
                if (generateCodeDto.getIsGenerateVue()) {
                    generateVue(generateCodeDto, codeGeneratorParams, tableInfoBo, root);
                }
                if (tableAndFieldDto.getIsGenerateMenu()) {
                    tableNameHumpMap.put(tableInfoBo.getTableNameHump(), tableInfoBo.getTableComment());
                }
            }
            List<TableInfo> tableInfoList = BeanUtil.copyToList(generateCodeDto.getTableAndFieldDtoList(), TableInfo.class);
            tableInfoService.remove(new LambdaQueryWrapper<TableInfo>()
                    .eq(TableInfo::getDatabaseConnectionId, generateCodeDto.getDatabaseConnectionId())
                    .eq(TableInfo::getDatabaseName, generateCodeDto.getDatabaseName())
                    .in(TableInfo::getTableName, generateCodeDto.getDatabaseTableList()));
            tableInfoService.saveBatch(tableInfoList);
        } catch (IOException | TemplateException e) {
            log.error(e.getMessage());
            return false;
        }
        return true;
    }

    @Override
    public List<UiTypeVo> getUiTypeList() {
        UiTypeEnum[] values = UiTypeEnum.values();
        List<UiTypeVo> uiTypeVoList = new ArrayList<>();
        for (UiTypeEnum uiTypeEnum : values) {
            UiTypeVo uiTypeVo = new UiTypeVo();
            uiTypeVo.setKey(uiTypeEnum.getCode());
            uiTypeVo.setValue(uiTypeEnum.getMessage());
            uiTypeVoList.add(uiTypeVo);
        }
        return uiTypeVoList;
    }

    private void generateJava(GenerateCodeDto generateCodeDto, CodeGeneratorParams codeGeneratorParams, TableInfoBo tableInfoBo, Map<String, Object> root) throws IOException, TemplateException {
        File javaEntityFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/entity/" + tableInfoBo.getTableNameGreatHump() + ".java");
        Template javaEntityTemplate = freeMarkerConfiguration.getTemplate("custom/java/entity.java.ftl");
        writeDocument(javaEntityFile, javaEntityTemplate, root, generateCodeDto.getIsCover());

        File javaMapperXmlFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/resources/" + "/mapper/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameGreatHump() + "Mapper.xml");
        Template javaMapperXmlTemplate = freeMarkerConfiguration.getTemplate("custom/java/mapper.xml.ftl");
        writeDocument(javaMapperXmlFile, javaMapperXmlTemplate, root, generateCodeDto.getIsCover());

        File javaMapperFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/mapper/" + tableInfoBo.getTableNameGreatHump() + "Mapper.java");
        Template javaMapperTemplate = freeMarkerConfiguration.getTemplate("custom/java/mapper.java.ftl");
        writeDocument(javaMapperFile, javaMapperTemplate, root, generateCodeDto.getIsCover());

        File javaServiceFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/service/I" + tableInfoBo.getTableNameGreatHump() + "Service.java");
        Template javaServiceTemplate = freeMarkerConfiguration.getTemplate("custom/java/service.java.ftl");
        writeDocument(javaServiceFile, javaServiceTemplate, root, generateCodeDto.getIsCover());

        File javaServiceImplFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/service/impl/" + tableInfoBo.getTableNameGreatHump() + "ServiceImpl.java");
        Template javaServiceImplTemplate = freeMarkerConfiguration.getTemplate("custom/java/serviceImpl.java.ftl");
        writeDocument(javaServiceImplFile, javaServiceImplTemplate, root, generateCodeDto.getIsCover());

        File javaControllerFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/controller/" + tableInfoBo.getTableNameGreatHump() + "Controller.java");
        Template javaControllerTemplate = freeMarkerConfiguration.getTemplate("custom/java/controller.java.ftl");
        writeDocument(javaControllerFile, javaControllerTemplate, root, generateCodeDto.getIsCover());

        File javaVoFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/vo/" + tableInfoBo.getTableNameGreatHump() + "Vo.java");
        Template javaVoTemplate = freeMarkerConfiguration.getTemplate("custom/java/vo.java.ftl");
        writeDocument(javaVoFile, javaVoTemplate, root, generateCodeDto.getIsCover());

        File javaPageDtoFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/dto/" + tableInfoBo.getTableNameGreatHump() + "PageDto.java");
        Template javaPageDtoTemplate = freeMarkerConfiguration.getTemplate("custom/java/pageDto.java.ftl");
        writeDocument(javaPageDtoFile, javaPageDtoTemplate, root, generateCodeDto.getIsCover());

        File javaInsertDtoFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/dto/" + tableInfoBo.getTableNameGreatHump() + "InsertDto.java");
        Template javaInsertDtoTemplate = freeMarkerConfiguration.getTemplate("custom/java/insertDto.java.ftl");
        writeDocument(javaInsertDtoFile, javaInsertDtoTemplate, root, generateCodeDto.getIsCover());

        File javaUpdateDtoFile = new File(codeGeneratorParams.getJavaProjectAddress() + "/src/main/java/" + codeGeneratorParams.getPackageName().replace(".", "/") + "/" + codeGeneratorParams.getModuleName() + "/dto/" + tableInfoBo.getTableNameGreatHump() + "UpdateDto.java");
        Template javaUpdateDtoTemplate = freeMarkerConfiguration.getTemplate("custom/java/updateDto.java.ftl");
        writeDocument(javaUpdateDtoFile, javaUpdateDtoTemplate, root, generateCodeDto.getIsCover());
    }

    private void generateVue(GenerateCodeDto generateCodeDto, CodeGeneratorParams codeGeneratorParams, TableInfoBo tableInfoBo, Map<String, Object> root) throws IOException, TemplateException {
        File vueResultFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/api/result/" + tableInfoBo.getTableNameHump() + ".ts");
        Template vueResultTemplate = freeMarkerConfiguration.getTemplate("custom/vue/result.ts.ftl");
        writeDocument(vueResultFile, vueResultTemplate, root, generateCodeDto.getIsCover());

        File vueIndexFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/index.vue");
        Template vueIndexTemplate = freeMarkerConfiguration.getTemplate("custom/vue/index.vue.ftl");
        writeDocument(vueIndexFile, vueIndexTemplate, root, generateCodeDto.getIsCover());

        File vueTableFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/table/index.vue");
        Template vueTableTemplate = freeMarkerConfiguration.getTemplate("custom/vue/table.vue.ftl");
        writeDocument(vueTableFile, vueTableTemplate, root, generateCodeDto.getIsCover());

        File vueSearchFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/search/index.vue");
        Template vueSearchTemplate = freeMarkerConfiguration.getTemplate("custom/vue/search.vue.ftl");
        writeDocument(vueSearchFile, vueSearchTemplate, root, generateCodeDto.getIsCover());

        File vueMenuFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/menu/index.vue");
        Template vueMenuTemplate = freeMarkerConfiguration.getTemplate("custom/vue/menu.vue.ftl");
        writeDocument(vueMenuFile, vueMenuTemplate, root, generateCodeDto.getIsCover());

        File vueVoFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/interface/vo/" + tableInfoBo.getTableNameHump() + "/" + tableInfoBo.getTableNameGreatHump() + "Vo.ts");
        Template vueVoTemplate = freeMarkerConfiguration.getTemplate("custom/vue/vo.ts.ftl");
        writeDocument(vueVoFile, vueVoTemplate, root, generateCodeDto.getIsCover());

        File vueDetailsFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/dialog/details/index.vue");
        Template vueDetailsTemplate = freeMarkerConfiguration.getTemplate("custom/vue/details.vue.ftl");
        writeDocument(vueDetailsFile, vueDetailsTemplate, root, generateCodeDto.getIsCover());

        File vuePageDtoFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/interface/dto/" + tableInfoBo.getTableNameHump() + "/" + tableInfoBo.getTableNameGreatHump() + "PageDto.ts");
        Template vuePageDtoTemplate = freeMarkerConfiguration.getTemplate("custom/vue/pageDto.ts.ftl");
        writeDocument(vuePageDtoFile, vuePageDtoTemplate, root, generateCodeDto.getIsCover());

        File vueInsertDtoFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/interface/dto/" + tableInfoBo.getTableNameHump() + "/" + tableInfoBo.getTableNameGreatHump() + "InsertDto.ts");
        Template vueInsertDtoTemplate = freeMarkerConfiguration.getTemplate("custom/vue/insertDto.ts.ftl");
        writeDocument(vueInsertDtoFile, vueInsertDtoTemplate, root, generateCodeDto.getIsCover());

        File vueAddFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/dialog/add/index.vue");
        Template vueAddTemplate = freeMarkerConfiguration.getTemplate("custom/vue/add.vue.ftl");
        writeDocument(vueAddFile, vueAddTemplate, root, generateCodeDto.getIsCover());

        File vueUpdateDtoFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/interface/dto/" + tableInfoBo.getTableNameHump() + "/" + tableInfoBo.getTableNameGreatHump() + "UpdateDto.ts");
        Template vueUpdateDtoTemplate = freeMarkerConfiguration.getTemplate("custom/vue/updateDto.ts.ftl");
        writeDocument(vueUpdateDtoFile, vueUpdateDtoTemplate, root, generateCodeDto.getIsCover());

        File vueEditFile = new File(codeGeneratorParams.getVueProjectAddress() + "/src/view/" + codeGeneratorParams.getModuleName() + "/" + tableInfoBo.getTableNameHump() + "/dialog/edit/index.vue");
        Template vueEditTemplate = freeMarkerConfiguration.getTemplate("custom/vue/edit.vue.ftl");
        writeDocument(vueEditFile, vueEditTemplate, root, generateCodeDto.getIsCover());
    }
}
