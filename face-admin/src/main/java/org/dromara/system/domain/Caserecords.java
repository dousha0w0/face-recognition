package org.dromara.system.domain;

import org.dromara.common.mybatis.core.domain.BaseEntity;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serial;

/**
 * 病例信息对象 caserecords
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("caserecords")
public class Caserecords extends BaseEntity {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 病例ID
     */
    @TableId(value = "case_id")
    private Long caseId;

    /**
     * 用户ID
     */
    private Long userId;

    /**
     * 患者性别
     */
    private String gender;

    /**
     * 患者年龄
     */
    private Long age;

    /**
     * 既往病史
     */
    private String medicalhistory;

    /**
     * 药物过敏病史
     */
    private String drugallergy;

    /**
     * 手术史
     */
    private String surgicalHistory;

    /**
     * 记录的时间戳
     */
    private Date timestamp;


}
