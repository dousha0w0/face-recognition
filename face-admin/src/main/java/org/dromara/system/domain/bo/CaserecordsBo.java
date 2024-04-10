package org.dromara.system.domain.bo;

import org.dromara.system.domain.Caserecords;
import org.dromara.common.mybatis.core.domain.BaseEntity;
import org.dromara.common.core.validate.AddGroup;
import org.dromara.common.core.validate.EditGroup;
import io.github.linpeilie.annotations.AutoMapper;
import lombok.Data;
import lombok.EqualsAndHashCode;
import jakarta.validation.constraints.*;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 病例信息业务对象 caserecords
 *
 * @author Lion Li
 * @date 2024-04-10
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AutoMapper(target = Caserecords.class, reverseConvertGenerate = false)
public class CaserecordsBo extends BaseEntity {

    /**
     * 病例ID
     */
    @NotNull(message = "病例ID不能为空", groups = { EditGroup.class })
    private Long caseId;

    /**
     * 用户ID
     */
    @NotNull(message = "用户ID不能为空", groups = { AddGroup.class, EditGroup.class })
    private Long userId;

    /**
     * 患者性别
     */
    @NotBlank(message = "患者性别不能为空", groups = { AddGroup.class, EditGroup.class })
    private String gender;

    /**
     * 患者年龄
     */
    @NotNull(message = "患者年龄不能为空", groups = { AddGroup.class, EditGroup.class })
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
    @NotNull(message = "记录的时间戳不能为空", groups = { AddGroup.class, EditGroup.class })
    private Date timestamp;


}
