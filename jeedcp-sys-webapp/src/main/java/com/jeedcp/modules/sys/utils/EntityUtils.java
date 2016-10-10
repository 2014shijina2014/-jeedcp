package com.jeedcp.modules.sys.utils;



import com.jeedcp.common.persistence.DataEntity;
import com.jeedcp.common.utils.IdUtils;

import java.util.Date;

/**
 * Created by Jeedcp on 15/9/24.
 */
public class EntityUtils {

    /**
     * 写入DataEntity的基本信息
     * @param dataEntity
     * @param userId
     */
    public void preEntitySaving(DataEntity dataEntity, String userId) {
        // 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
        if (!dataEntity.getIsNewRecord()) {
            dataEntity.setId(IdUtils.uuid());
            dataEntity.setCreateBy(userId);
            dataEntity.setCreateDate(new Date());
        }
        dataEntity.setUpdateBy(userId);
        dataEntity.setUpdateDate(new Date());
    }
}
