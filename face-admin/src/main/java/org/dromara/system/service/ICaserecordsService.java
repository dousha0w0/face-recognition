package org.dromara.system.service;

import org.dromara.system.domain.Caserecords;
import org.dromara.system.domain.vo.CaserecordsVo;
import org.dromara.system.domain.bo.CaserecordsBo;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;

import java.util.Collection;
import java.util.List;

/**
 * 病例信息Service接口
 *
 * @author Lion Li
 * @date 2024-04-10
 */
public interface ICaserecordsService {

    /**
     * 查询病例信息
     */
    CaserecordsVo queryById(Long caseId);

    /**
     * 查询病例信息列表
     */
    TableDataInfo<CaserecordsVo> queryPageList(CaserecordsBo bo, PageQuery pageQuery);

    /**
     * 查询病例信息列表
     */
    List<CaserecordsVo> queryList(CaserecordsBo bo);

    /**
     * 新增病例信息
     */
    Boolean insertByBo(CaserecordsBo bo);

    /**
     * 修改病例信息
     */
    Boolean updateByBo(CaserecordsBo bo);

    /**
     * 校验并批量删除病例信息信息
     */
    Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid);
}
