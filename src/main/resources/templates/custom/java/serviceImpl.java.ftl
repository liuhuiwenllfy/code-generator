<#-- @formatter:off -->
package ${basicParameter.packageName}.${basicParameter.moduleName}.service.impl;

<#if tableInfo.isGenerateTreeSelect!false>
import ${basicParameter.packageName}.core.config.mybatisplus.entity.TreeNode;
import ${basicParameter.packageName}.system.mapper.TenantInfoMapper;
import ${basicParameter.packageName}.core.config.security.utils.SecurityContextUtils;
import ${basicParameter.packageName}.utils.TreeNodeUtils;
</#if>
import ${basicParameter.packageName}.${basicParameter.moduleName}.entity.${tableInfo.tableNameGreatHump};
import ${basicParameter.packageName}.${basicParameter.moduleName}.vo.${tableInfo.tableNameGreatHump}Vo;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}PageDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}InsertDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.dto.${tableInfo.tableNameGreatHump}UpdateDto;
import ${basicParameter.packageName}.${basicParameter.moduleName}.mapper.${tableInfo.tableNameGreatHump}Mapper;
import ${basicParameter.packageName}.${basicParameter.moduleName}.service.I${tableInfo.tableNameGreatHump}Service;
<#list tableInfo.tableField as field>
    <#if (field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP")) || tableInfo.isCache!false>
import cn.liulingfengyu.utils.CacheNameUtils;
        <#break/>
    </#if>
</#list>
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import jakarta.annotation.Resource;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${basicParameter.packageName}.core.config.mybatisplus.PageUtils;

import java.util.List;

/**
 * <p>
 * ${tableInfo.tableComment!} 服务实现类
 * </p>
 *
 * @author ${basicParameter.author}
 * @since ${date}
 */
@Service
public class ${tableInfo.tableNameGreatHump}ServiceImpl extends ServiceImpl<${tableInfo.tableNameGreatHump}Mapper, ${tableInfo.tableNameGreatHump}> implements I${tableInfo.tableNameGreatHump}Service {

<#if tableInfo.isGenerateTreeSelect!false>
    @Resource
    private TenantInfoMapper tenantInfoMapper;

    @Autowired
    private SecurityContextUtils securityContextUtils;
</#if>

    @Override
    public IPage<${tableInfo.tableNameGreatHump}Vo> getByPage(${tableInfo.tableNameGreatHump}PageDto dto) {
        Page<${tableInfo.tableNameGreatHump}Vo> page = new PageUtils<${tableInfo.tableNameGreatHump}Vo>().getPage(dto);
        List<${tableInfo.tableNameGreatHump}Vo> list = baseMapper.getByPage(page, dto);
        list.forEach(item -> {
<#list tableInfo.tableField as field>
    <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>
        <#if field.isShowDict!false>
            item.set${field.columnNameBigHump}Name(CacheNameUtils.getCacheName("${field.dictGroup}" + item.get${field.columnNameBigHump}()));
        <#else>
            item.set${field.columnNameBigHump}Name(CacheNameUtils.getCacheName(item.get${field.columnNameBigHump}()));
        </#if>
    </#if>
</#list>
        });
        page.setRecords(list);
        return page;
    }

    @Override
    public List<${tableInfo.tableNameGreatHump}Vo> getList() {
        List<${tableInfo.tableNameGreatHump}Vo> list = baseMapper.getList();
        list.forEach(item -> {
<#list tableInfo.tableField as field>
    <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>
        <#if field.isShowDict!false>
            item.set${field.columnNameBigHump}Name(CacheNameUtils.getCacheName("${field.dictGroup}" + item.get${field.columnNameBigHump}()));
        <#else>
            item.set${field.columnNameBigHump}Name(CacheNameUtils.getCacheName(item.get${field.columnNameBigHump}()));
        </#if>
    </#if>
</#list>
        });
        return list;
    }

    @Override
    public ${tableInfo.tableNameGreatHump}Vo queryById(String id) {
        ${tableInfo.tableNameGreatHump}Vo ${tableInfo.tableNameHump}Vo = baseMapper.queryById(id);
<#list tableInfo.tableField as field>
    <#if field.uiType?? && (field.uiType == "SELECT_BOX" || field.uiType == "OPTION_GROUP" || field.uiType == "TREE_SELECTION")>
        <#if field.isShowDict!false>
        ${tableInfo.tableNameHump}Vo.set${field.columnNameBigHump}Name(CacheNameUtils.getCacheName("${field.dictGroup}" + ${tableInfo.tableNameHump}Vo.get${field.columnNameBigHump}()));
        <#else>
        ${tableInfo.tableNameHump}Vo.set${field.columnNameBigHump}Name(CacheNameUtils.getCacheName(${tableInfo.tableNameHump}Vo.get${field.columnNameBigHump}()));
        </#if>
    </#if>
</#list>
        return ${tableInfo.tableNameHump}Vo;
    }

<#if tableInfo.isGenerateTreeSelect!false>
    @Override
    public List<TreeNode> getTree() {
        return new TreeNodeUtils<>().getTree(baseMapper.getTree(), tenantInfoMapper.selectById(securityContextUtils.getTenantId()).getTenantName(), TreeNode.class);
    }
</#if>

    @Override
    public boolean insertItem(${tableInfo.tableNameGreatHump}InsertDto dto) {
        ${tableInfo.tableNameGreatHump} entity = new ${tableInfo.tableNameGreatHump}();
        BeanUtils.copyProperties(dto, entity);
<#if tableInfo.isCache!false>
        boolean save = this.save(entity);
        if (save) {
            CacheNameUtils.addCacheName(entity.get${tableInfo.cacheKeyBigHump}(), entity.get${tableInfo.cacheValueBigHump}());
        }
        return save;
<#else>
        return this.save(entity);
</#if>
    }

    @Override
    public boolean updateItem(${tableInfo.tableNameGreatHump}UpdateDto dto) {
        ${tableInfo.tableNameGreatHump} entity = new ${tableInfo.tableNameGreatHump}();
        BeanUtils.copyProperties(dto, entity);
<#if tableInfo.isCache!false>
        boolean updateById = this.updateById(entity);
        if (updateById) {
            CacheNameUtils.addCacheName(entity.get${tableInfo.cacheKeyBigHump}(), entity.get${tableInfo.cacheValueBigHump}());
        }
        return updateById;
<#else>
        return this.updateById(entity);
</#if>
    }

    @Override
    public boolean deleteBatchByIdList(List<String> idList) {
<#if tableInfo.isCache!false>
        boolean deleteByIds = baseMapper.deleteByIds(idList) > 0;
        if (deleteByIds) {
            idList.forEach(CacheNameUtils::deleteCacheName);
        }
        return deleteByIds;
<#else>
        return baseMapper.deleteByIds(idList) > 0;
</#if>
    }

<#if tableInfo.isCache!false>
    @Override
    public void initCache() {
        this.list().forEach(${tableInfo.tableNameHump} -> CacheNameUtils.addCacheName(${tableInfo.tableNameHump}.get${tableInfo.cacheKeyBigHump}(), ${tableInfo.tableNameHump}.get${tableInfo.cacheValueBigHump}()));
    }
</#if>
}
