package org.dromara.system.service.impl;

import org.dromara.common.core.utils.MapstructUtils;
import org.dromara.common.core.utils.StringUtils;
import org.dromara.common.mybatis.core.page.TableDataInfo;
import org.dromara.common.mybatis.core.page.PageQuery;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.dromara.system.domain.bo.CaserecordsBo;
import org.dromara.system.domain.vo.CaserecordsVo;
import org.dromara.system.domain.Caserecords;
import org.dromara.system.mapper.CaserecordsMapper;
import org.dromara.system.service.ICaserecordsService;

import java.util.List;
import java.util.Map;
import java.util.Collection;

/**
 * 病例信息Service业务层处理
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@RequiredArgsConstructor
@Service
public class CaserecordsServiceImpl implements ICaserecordsService {

    private final CaserecordsMapper baseMapper;

    /**
     * 查询病例信息
     */
    @Override
    public CaserecordsVo queryById(Long caseId){
        return baseMapper.selectVoById(caseId);
    }

    /**
     * 查询病例信息列表
     */
    @Override
    public TableDataInfo<CaserecordsVo> queryPageList(CaserecordsBo bo, PageQuery pageQuery) {
        LambdaQueryWrapper<Caserecords> lqw = buildQueryWrapper(bo);
        Page<CaserecordsVo> result = baseMapper.selectVoPage(pageQuery.build(), lqw);
        return TableDataInfo.build(result);
    }

    /**
     * 查询病例信息列表
     */
    @Override
    public List<CaserecordsVo> queryList(CaserecordsBo bo) {
        LambdaQueryWrapper<Caserecords> lqw = buildQueryWrapper(bo);
        return baseMapper.selectVoList(lqw);
    }

    private LambdaQueryWrapper<Caserecords> buildQueryWrapper(CaserecordsBo bo) {
        Map<String, Object> params = bo.getParams();
        LambdaQueryWrapper<Caserecords> lqw = Wrappers.lambdaQuery();
        lqw.eq(bo.getUserId() != null, Caserecords::getUserId, bo.getUserId());
        lqw.eq(StringUtils.isNotBlank(bo.getGender()), Caserecords::getGender, bo.getGender());
        lqw.eq(bo.getAge() != null, Caserecords::getAge, bo.getAge());
        lqw.eq(StringUtils.isNotBlank(bo.getMedicalhistory()), Caserecords::getMedicalhistory, bo.getMedicalhistory());
        lqw.eq(StringUtils.isNotBlank(bo.getDrugallergy()), Caserecords::getDrugallergy, bo.getDrugallergy());
        lqw.eq(StringUtils.isNotBlank(bo.getSurgicalHistory()), Caserecords::getSurgicalHistory, bo.getSurgicalHistory());
        lqw.eq(bo.getTimestamp() != null, Caserecords::getTimestamp, bo.getTimestamp());
        return lqw;
    }

    /**
     * 新增病例信息
     */
    @Override
    public Boolean insertByBo(CaserecordsBo bo) {
        Caserecords add = MapstructUtils.convert(bo, Caserecords.class);
        validEntityBeforeSave(add);
        boolean flag = baseMapper.insert(add) > 0;
        if (flag) {
            bo.setCaseId(add.getCaseId());
        }
        return flag;
    }

    /**
     * 修改病例信息
     */
    @Override
    public Boolean updateByBo(CaserecordsBo bo) {
        Caserecords update = MapstructUtils.convert(bo, Caserecords.class);
        validEntityBeforeSave(update);
        return baseMapper.updateById(update) > 0;
    }

    /**
     * 保存前的数据校验
     */
    private void validEntityBeforeSave(Caserecords entity){
        //TODO 做一些数据校验,如唯一约束
    }

    /**
     * 批量删除病例信息
     */
    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
            //TODO 做一些业务上的校验,判断是否需要校验
        }
        return baseMapper.deleteBatchIds(ids) > 0;
    }
}
