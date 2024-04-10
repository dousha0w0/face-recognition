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
import org.dromara.system.domain.vo.FaceinfosVo;
import org.dromara.system.domain.bo.FaceinfosBo;
import org.dromara.system.service.IFaceinfosService;
import org.dromara.common.mybatis.core.page.TableDataInfo;

/**
 * 人脸信息
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Validated
@RequiredArgsConstructor
@RestController
@RequestMapping("/system/faceinfos")
public class FaceinfosController extends BaseController {

    private final IFaceinfosService faceinfosService;

    /**
     * 查询人脸信息列表
     */
    @SaCheckPermission("system:faceinfos:list")
    @GetMapping("/list")
    public TableDataInfo<FaceinfosVo> list(FaceinfosBo bo, PageQuery pageQuery) {
        return faceinfosService.queryPageList(bo, pageQuery);
    }

    /**
     * 导出人脸信息列表
     */
    @SaCheckPermission("system:faceinfos:export")
    @Log(title = "人脸信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(FaceinfosBo bo, HttpServletResponse response) {
        List<FaceinfosVo> list = faceinfosService.queryList(bo);
        ExcelUtil.exportExcel(list, "人脸信息", FaceinfosVo.class, response);
    }

    /**
     * 获取人脸信息详细信息
     *
     * @param faceId 主键
     */
    @SaCheckPermission("system:faceinfos:query")
    @GetMapping("/{faceId}")
    public R<FaceinfosVo> getInfo(@NotNull(message = "主键不能为空")
                                     @PathVariable Long faceId) {
        return R.ok(faceinfosService.queryById(faceId));
    }

    /**
     * 新增人脸信息
     */
    @SaCheckPermission("system:faceinfos:add")
    @Log(title = "人脸信息", businessType = BusinessType.INSERT)
    @RepeatSubmit()
    @PostMapping()
    public R<Void> add(@Validated(AddGroup.class) @RequestBody FaceinfosBo bo) {
        return toAjax(faceinfosService.insertByBo(bo));
    }

    /**
     * 修改人脸信息
     */
    @SaCheckPermission("system:faceinfos:edit")
    @Log(title = "人脸信息", businessType = BusinessType.UPDATE)
    @RepeatSubmit()
    @PutMapping()
    public R<Void> edit(@Validated(EditGroup.class) @RequestBody FaceinfosBo bo) {
        return toAjax(faceinfosService.updateByBo(bo));
    }

    /**
     * 删除人脸信息
     *
     * @param faceIds 主键串
     */
    @SaCheckPermission("system:faceinfos:remove")
    @Log(title = "人脸信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/{faceIds}")
    public R<Void> remove(@NotEmpty(message = "主键不能为空")
                          @PathVariable Long[] faceIds) {
        return toAjax(faceinfosService.deleteWithValidByIds(List.of(faceIds), true));
    }
}
