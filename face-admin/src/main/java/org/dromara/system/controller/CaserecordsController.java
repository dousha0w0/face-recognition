package org.dromara.system.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.constraints.*;
import cn.dev33.satoken.annotation.SaCheckPermission;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import org.dromara.common.idempotent.annotation.RepeatSubmit;
import org.dromara.common.log.annotation.Log;
import org.dromara.common.web.core.BaseController;
import org.dromara.common.mybatis.core.page.PageQuery;
import org.dromara.common.core.domain.R;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import org.dromara.common.log.enums.BusinessType;
import org.dromara.common.excel.utils.ExcelUtil;
import org.dromara.system.domain.vo.CaserecordsVo;
import org.dromara.system.domain.bo.CaserecordsBo;
import org.dromara.system.service.ICaserecordsService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 病例信息
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/caserecords")
public class CaserecordsController extends BaseController {

    private final ICaserecordsService caserecordsService;

    /**
     * 查询病例信息列表
     */
    @SaCheckPermission("system:caserecords:list")
    @GetMapping("/list")
    public TableDataInfo<CaserecordsVo> list(CaserecordsBo bo, PageQuery pageQuery) {
        return caserecordsService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出病例信息列表
     */
    @SaCheckPermission("system:caserecords:export")
    @Log(title = "病例信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(CaserecordsBo bo, HttpServletResponse response) {
        List<CaserecordsVo> list = caserecordsService.queryList(bo);
        ExcelUtil.exportExcel(list, "病例信息", CaserecordsVo.class, response);
    }

    /**
     * 获取病例信息详细信息
     *
     * @param caseId 主键
     */
    @SaCheckPermission("system:caserecords:query")
    @GetMapping("/{caseId}")
    public R<CaserecordsVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long caseId) {
        return R.ok(caserecordsService.queryById(caseId));
    }

    /**
     * 新增病例信息
     */
    @SaCheckPermission("system:caserecords:add")
    @Log(title = "病例信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody CaserecordsBo bo) {
        return toAjax(caserecordsService.insertByBo(bo));
    }

    /**
     * 修改病例信息
     */
    @SaCheckPermission("system:caserecords:edit")
    @Log(title = "病例信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody CaserecordsBo bo) {
        return toAjax(caserecordsService.updateByBo(bo));
    }

    /**
     * 删除病例信息
     *
     * @param caseIds 主键串
     */
    @SaCheckPermission("system:caserecords:remove")
    @Log(title = "病例信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{caseIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] caseIds) {
        return toAjax(caserecordsService.deleteWithValidByIds(List.of(caseIds), true));
    }
}
