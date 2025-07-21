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
public class ${tableInfo.tableNameGreatHump}ServiceImpl extends ServiceImpl
<${tableInfo.tableNameGreatHump}Mapper, ${tableInfo.tableNameGreatHump}> implements I${tableInfo.tableNameGreatHump}Service {

<#if tableInfo.isGenerateTreeSelect!false>
    @Resource
    private TenantInfoMapper tenantInfoMapper;

    @Autowired
    private SecurityContextUtils securityContextUtils;
</#if>

@Override
public IPage
<${tableInfo.tableNameGreatHump}Vo> getByPage(${tableInfo.tableNameGreatHump}PageDto dto) {
    Page
    <${tableInfo.tableNameGreatHump}Vo> page = new PageUtils
        <${tableInfo.tableNameGreatHump}Vo>().getPage(dto);
            List
            <${tableInfo.tableNameGreatHump}Vo> list = baseMapper.getByPage(page, dto);
                page.setRecords(list);
                return page;
                }

                @Override
                public ${tableInfo.tableNameGreatHump}Vo queryById(String id) {
                return baseMapper.queryById(id);
                }

                <#if tableInfo.isGenerateTreeSelect!false>
                @Override
                public List
                <TreeNode> getTree() {
                    return TreeNodeUtils.getTree(baseMapper.getList(),
                    tenantInfoMapper.selectById(securityContextUtils.getTenantId()).getTenantName());
                    }
                    </#if>

                    @Override
                    public boolean insertItem(${tableInfo.tableNameGreatHump}InsertDto dto) {
                    ${tableInfo.tableNameGreatHump} entity = new ${tableInfo.tableNameGreatHump}();
                    BeanUtils.copyProperties(dto, entity);
                    return this.save(entity);
                    }

                    @Override
                    public boolean updateItem(${tableInfo.tableNameGreatHump}UpdateDto dto) {
                    ${tableInfo.tableNameGreatHump} entity = new ${tableInfo.tableNameGreatHump}();
                    BeanUtils.copyProperties(dto, entity);
                    return this.updateById(entity);
                    }

                    @Override
                    public boolean deleteBatchByIdList(List
                    <String> idList) {
                        return baseMapper.deleteBatchIds(idList) > 0;
                        }
                        }
