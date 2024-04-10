package org.dromara.system.domain.vo;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.dromara.system.domain.Caserecords;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import org.dromara.common.excel.annotation.ExcelDictFormat;
import org.dromara.common.excel.convert.ExcelDictConvert;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.Date;



/**
 * 病例信息视图对象 caserecords
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Data
@ExcelIgnoreUnannotated
@AutoMapper(target = Caserecords.class)
public class CaserecordsVo implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 病例ID
     */
    @ExcelProperty(value = "病例ID")
    private Long caseId;

    /**
     * 用户ID
     */
    @ExcelProperty(value = "用户ID")
    private Long userId;

    /**
     * 患者性别
     */
    @ExcelProperty(value = "患者性别", converter = ExcelDictConvert.class)
    @ExcelDictFormat(dictType = "sys_user_sex")
    private String gender;

    /**
     * 患者年龄
     */
    @ExcelProperty(value = "患者年龄")
    private Long age;

    /**
     * 既往病史
     */
    @ExcelProperty(value = "既往病史")
    private String medicalhistory;

    /**
     * 药物过敏病史
     */
    @ExcelProperty(value = "药物过敏病史")
    private String drugallergy;

    /**
     * 手术史
     */
    @ExcelProperty(value = "手术史")
    private String surgicalHistory;

    /**
     * 记录的时间戳
     */
    @ExcelProperty(value = "记录的时间戳")
    private Date timestamp;


}
